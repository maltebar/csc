class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	has_many :replies

	after_create :notify

	def notify
		@post = Post.find(self.post.id)
		url = Rails.application.routes.url_helpers.post_path(@post)
		@comments = Comment.where(post_id: @post.id)
		@users = [@post.user]
		@comments.each do |comment|
			@users = @users + [comment.user]
		end 
		@users.uniq.each do |u| 
			if u == @post.user
				Notification.create(recipient: u, creator: User.find(self.user_id), action: "New Comment on Your Post", url: url)
			else
  				Notification.create(recipient: u, creator: User.find(self.user_id), action: "New Comment on a Post You Commented On", url: url)
	  		end
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end
end
