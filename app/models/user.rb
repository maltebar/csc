class User < ActiveRecord::Base
	has_many :notifications
	has_many :posts
	has_many :badges
	belongs_to :group
	has_many :comments
	has_many :replies
	has_many :messages, class_name: "Ahoy::Message"
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	after_create :make_groups

	def make_groups
		if !self.admin?
			group_id = self.id % Group.all.count
			id = Group.ids[group_id]
			self.update(group_id: id)
		end
	end
end
