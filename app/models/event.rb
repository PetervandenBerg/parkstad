class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :calendar
  has_many :user

  has_many :attendances
	accepts_nested_attributes_for :attendances

	validates :name, presence: true
	validates :start_at, presence: true
end
