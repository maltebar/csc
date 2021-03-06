class Post < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :user
	belongs_to :assignment
	has_many :comments
	has_many :badges
	after_create :notify
	before_save :update_first_draft

	def notify
		url = Rails.application.routes.url_helpers.post_path(self)
		@users = User.where(group_id: User.find(self.user_id).group_id) 
		@users.each do |u| 
			if u != self.user
  				Notification.create(recipient: u, creator: User.find(self.user_id), action: self.user.nickname+" Submitted a Post in Your Group for Assignment "+self.assignment.title, url: url)
	  		end
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end

	def update_first_draft
		if self.assignment.draft_due > Time.zone.now 
			self.first_draft = self.content
		end
	end
end
