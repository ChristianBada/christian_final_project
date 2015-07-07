class Post < ActiveRecord::Base
	validates :title, presence:true
	validates :discussion_id, presence:true

	belongs_to :discussion

	belongs_to :user
end
