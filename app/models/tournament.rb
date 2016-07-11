class Tournament < ActiveRecord::Base
	belongs_to :assignment
	has_many :evaluations
	after_create :make_evals
	after_create :notify
	after_save :notify_closed

	def notify
		url = Rails.application.routes.url_helpers.tournaments_path
		@users = User.all 
		@users.each do |u| 
  			Notification.create(recipient: u, action: "New Tournament Posted", url: url)
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end

	def notify_closed
		if self.closed?
			url = Rails.application.routes.url_helpers.evaluations_path(:tournament_id => self.id)
			@users = User.all 
			@users.each do |u| 
	  			Notification.create(recipient: u, action: "Results from Tournament Have Been Posted", url: url)
		  		if (u.notificationFrequency == 1 || u.admin == true)
				    # use nil as parameter if you want link to be homepage, can also use url 
				    # change title of email by changing 'Notifications'
		    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
		  		end 
			end
		end
	end


	def make_evals
		@posts = find_top_10_posts(self)
		User.all.each do |user|
			@posts.each do |post|
				Evaluation.create(tournament_id: self.id, user_id: user.id, post_id: post)
			end
		end
	end

	def find_top_10_posts(tournament)
		@posts = Hash.new
		Post.where(assignment_id: tournament.assignment.id).each do |post|
			@posts[post.id] = score(post, tournament)
		end
		return @posts.sort_by(&:last).reverse[0..9].to_h.keys
	end

	def score(post, tournament)
		@post = post
		@tournament = tournament
		gd_score = Badge.where(post_id: @post.id, name: 'good design').count * (tournament.gd_percent / 100.0)
		ge_score = Badge.where(post_id: @post.id, name: 'good examples').count * (tournament.ge_percent / 100.0)
		ww_score = Badge.where(post_id: @post.id, name: 'well written').count * (tournament.ww_percent / 100.0)
		gr_score = Badge.where(post_id: @post.id, name: 'good reflection').count * (tournament.gr_percent / 100.0)
		read_score = Ahoy::Event.where(name: "Read Post").where_properties(post_id: @post.id).count * (tournament.read_percent / 100.0)
		return gd_score + ge_score + ww_score + gr_score + read_score
	end
end
