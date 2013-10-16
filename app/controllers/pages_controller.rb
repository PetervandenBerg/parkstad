class PagesController < ApplicationController
  def home
	@messages = Message.order('created_at DESC').first(2)
	@event = Event.where('start_at >= ?', Date.today).order("start_at ASC").first
	
	@there = @event.attendances.where(attending: true)
	@there_count = @event.attendances.where(attending: true).count
  end
end
