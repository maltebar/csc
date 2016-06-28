class Post < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :user
	belongs_to :assignment
	after_create :notify

	def notify
		url = Rails.application.routes.url_helpers.post_path(self)
		@users = User.where(group_id: User.find(self.user_id).group_id) 
		puts @users
		@users.each do |u| 
  			Notification.create(recipient: u, creator: User.find(self.user_id), action: "New Post Submitted in Your Group", url: url)
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end
end
