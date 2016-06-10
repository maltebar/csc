class AddNotificationFrequencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notificationFrequency, :integer
  end
end
