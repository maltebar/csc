namespace :cron do
  desc "Send notification emails every 24 hours"
  task deliver_emails: :environment do
    users = User.where(notificationFrequency: 2)
    users.each do |u|
      Notifier.new_notification(u, nil, 'Daily Notifications').deliver_now 
    end
  end
end