class User < ActiveRecord::Base
	has_many :notifications
	has_many :posts
	belongs_to :group
	has_many :comments
	has_many :messages, class_name: "Ahoy::Message"
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
