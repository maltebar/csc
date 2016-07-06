class Badge < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	after_create :notify

	def notify
		@post = Post.find(self.post.id)
		url = Rails.application.routes.url_helpers.post_path(@post) 
		Notification.create(recipient: @post.user, creator: User.find(self.user_id), action: "Your Post Received a New Badge", url: url)
  		if (@post.user.notificationFrequency == 1 || @post.user.admin == true)
		    # use nil as parameter if you want link to be homepage, can also use url 
		    # change title of email by changing 'Notifications'
    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
  		end 
	end
end
