class ForumPost < ActiveRecord::Base
	include Bootsy::Container
	searchkick
	belongs_to :user
	has_many :forum_post_replies
end
