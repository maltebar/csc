class Evaluation < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	belongs_to :tournament

	include RankedModel
	ranks :row_order
end
