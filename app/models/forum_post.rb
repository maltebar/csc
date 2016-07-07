class ForumPost < ActiveRecord::Base
	include Bootsy::Container
	searchkick word_start: [:title, :content]
	belongs_to :user
	has_many :forum_post_replies
end
