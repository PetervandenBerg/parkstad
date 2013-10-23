namespace :mail do	
	desc "Checks who to send e-mail to"
	task :reminder => :environment do
		if Time.now.wednesday?
			next_event = Event.where('start_at >= ?', Date.today).order("start_at ASC").first;
			users_there = next_event.attendances.where(attending: true).collect(&:user);
			users_not_there = next_event.attendances.where(attending: false).collect(&:user);
			users_filled_in = users_there + users_not_there;
			if next_event.kind == 1
				users = User.where(guest: false)
			elsif next_event.kind == 0 || a.kind == 2
				users = User.all
			end 
			users_to_mail = users - users_filled_in

			users_to_mail.each { |u| ParkstadMailer.reminder(u).deliver }
		end
	end 

	desc "If attendance is blank, set to false"
	task :cancel_training => :environment do
		if Time.now.thursday?
			next_event = Event.where('start_at >= ?', Date.today).order("start_at ASC").first;

			people_attending = next_event.attendances.where(attending: true).collect(&:user);
			people_not_attending = next_event.attendances.where(attending: false).collect(&:user);
			people = people_attending + people_not_attending
		  all_people = User.all;
	    people_not_there = all_people - people;

	    people_not_there.each do |u|
	    	next_event.attendances.new(attending: false, msg: "Automatisch: Aanwezigheid niet doorgegeven.", user_id: u.id).save
	    end

	    attending_next_event = next_event.attendances.where(attending: true)

			if attending_next_event.count < 7
				User.where(guest: false).each { |u| ParkstadMailer.cancel_training(u).deliver }
			end 
  	end
	end

end