class PagesController < ApplicationController
  def home
	@messages = Message.last(3) 
	@event = Event.where('start_at >= ?', Date.today).first
	@there = @event.attendances.where(attending: true)
	@there_count = @event.attendances.where(attending: true).count
  end
end
