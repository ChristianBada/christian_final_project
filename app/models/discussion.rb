class Discussion < ActiveRecord::Base
	validates :name, presence:true
	validates :topic_id, presence:true
	belongs_to :topic
	has_many :posts

end
