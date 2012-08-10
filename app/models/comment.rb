class Comment < ActiveRecord::Base

	belongs_to :product

	validates :content, :presence => true
end
