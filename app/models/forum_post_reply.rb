class ForumPostReply < ActiveRecord::Base
	belongs_to :user
	belongs_to :forum_post
	after_create :notify

	def notify
		@post = ForumPost.find(self.forum_post.id)
		url = Rails.application.routes.url_helpers.forum_posts_path(:forum_post_id => @post.id)
		@replies = ForumPostReply.where(forum_post_id: @post.id)
		@users = [@post.user]
		@replies.each do |reply|
			if reply.user != self.user
				@users = @users + [reply.user]
			end
		end 
		@users.uniq.each do |u| 
			if u == @post.user && @post.user != self.user
				Notification.create(recipient: u, creator: User.find(self.user_id), action: self.user.nickname+"  Replied to Your Forum Post: "+@post.title, url: url)
			elsif u != @post.user && @post.user != self.user
  				Notification.create(recipient: u, creator: User.find(self.user_id), action: self.user.nickname+" Replied to a Forum Post: "+@post.title, url: url)
	  		end
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end
end
