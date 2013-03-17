class Duck

	@@greeting = "Hello"

	def initialize(greeting)
		@greeting = greeting
	end

	def quack
		puts "#{@@greeting} #{@greeting}"
	end

	class << self
		
		attr_accessor :greeting

		def quack
			puts "#{@@greeting} #{@greeting}"
		end

	end

end

duck = Duck.new("quack quack")
duck.quack

Duck.greeting = "class quack"
Duck.quack