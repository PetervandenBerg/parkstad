class Attendance < ActiveRecord::Base
	belongs_to :event
	belongs_to :users
end
