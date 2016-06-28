class Assignment < ActiveRecord::Base
	has_many :posts
	after_create :notify

	def notify
		url = Rails.application.routes.url_helpers.assignment_path(self)
		@users = User.all 
		@users.each do |u| 
  			Notification.create(recipient: u, action: "New Assignment Posted", url: url)
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end

end
