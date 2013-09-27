class Message < ActiveRecord::Base
	belongs_to :user
	validates :msg, presence: true
	has_many :comments
	accepts_nested_attributes_for :comments
end
