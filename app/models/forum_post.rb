class ForumPost < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :user
	has_many :forum_post_replies
end
