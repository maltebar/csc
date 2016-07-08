class Reply < ActiveRecord::Base
	belongs_to :comment
	belongs_to :user
	after_create :notify

	def notify
		@comment = Comment.find(self.comment.id)
		url = Rails.application.routes.url_helpers.post_path(@comment.post_id)
		@replies = Reply.where(comment_id: @comment.id)
		@users = [@comment.user]
		@replies.each do |reply|
			if reply.user != self.user
				@users = @users + [reply.user]
			end
		end 
		@users.uniq.each do |u| 
			if u == @comment.user && @comment.user != self.user
				Notification.create(recipient: u, creator: User.find(self.user_id), action: self.user.nickname+" Replied to Your Comment", url: url)
			elsif u != @comment.user && @comment.user != self.user
  				Notification.create(recipient: u, creator: User.find(self.user_id), action: self.user.nickname+" Replied to a Comment You Replied To", url: url)
	  		end
	  		if (u.notificationFrequency == 1 || u.admin == true)
			    # use nil as parameter if you want link to be homepage, can also use url 
			    # change title of email by changing 'Notifications'
	    		Notifier.new_notification(u, nil, 'Notifications').deliver_now
	  		end 
		end
	end
end
