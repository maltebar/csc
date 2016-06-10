class AddNotificationFrequencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notifificationFrequency, :integer
  end
end
