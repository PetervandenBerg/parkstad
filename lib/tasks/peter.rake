desc "Checks who to send email."
task :receivers => :environment do
	User.where(guest: false).each { |u| puts u.email }; nil
end 

desc "Checks what Event is next"
task :eventnext => :environment do 
	a = Event.where('start_at >= ?', Date.today).order("start_at ASC").first
	puts a.name
end