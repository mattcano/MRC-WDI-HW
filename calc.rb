class Menu < Object

	attr_reader :num1, :num2, :operation

	def initialize
		@num1 = nil
		@num2 = nil
		@operation = nil
	end

	def greeting
		puts "Welcome to Calculator!!"
	end

	def prompt1
		puts "What is your first number?"
		@num1 = gets.chomp.to_f
	end

	def prompt2
		puts "What is your second number?"
		@num2 = gets.chomp.to_f
	end

	def prompt3
		puts "What operation would you like to perform?"
		puts "A = Add"
		puts "S = Subtract"
		puts "M = Multiply"
		puts "D = Divide"
		@operation = gets.chomp
	end

end

class Calculator < Object

	attr_reader :num1, :num2, :operation

	def initialize (menu)
		@num1 = menu.num1
		@num2 = menu.num2
		@operation = menu.operation.upcase
	end

	def add
		@num1 + @num2
	end

	def subtract
		@num1 - @num2
	end

	def multiply
		@num1 * @num2
	end

	def divide
		@num1/@num2
	end

end

continue = true

while continue
	m = Menu.new

	m.greeting
	m.prompt1
	m.prompt2
	m.prompt3

	c = Calculator.new(m)

	answer = nil

	case c.operation
		when "A"
			answer = c.add
		when "S"
			answer = c.subtract
		when "M"
			answer = c.multiply
		when "D"
			answer = c.divide
		else
			answer = "ERROR"
	end

	continue_response = ""

	puts "Your answer is #{answer}!!" unless answer == "ERROR"
	puts "***** Would you like to try this again (Y/N)? *****"
	continue_response = gets.chomp
	puts "---------------------------------------------"

	case continue_response.upcase
		when "N"
			continue = false
			puts "***** Seeee yaaaa! Thanks for playing! *****"
	end

end