class Order

	attr_reader :items, :placed_at, :time_spent_on_sending_email

	include ItemContainer

	def initialize
		@items = Array.new
	 	#....
	end

	def place
		@placed_at = Time.now
		thr = Thread.new do
			Pony.mail(:to => StoreApplication::Admin.email,
				:from => "My Store <jason.blinwood@gmail.com>",
				:via => :smtp, 
				:via_options => {
					address: 		'smtp.gmail.com',
					port: 			'587',
					user_name: 		'dildak@gmail.com',
					password: 		'antiria',
					authentication: :plain,
					domain: 		'mail.google.com'},
				subject: "New order has been placed", body: "please check back you admin page to see it!")
		end
		while (thr.alive?)
			puts "."
			sleep(0.5)
		end
		send_email_at = Time.now
		@time_spent_on_sending_email = send_email_at - @placed_at
	end

end