require 'drb/drb'

class Hello
	def hello
		puts('hello, world.')
	end
end

DRb.start_service('druby://localhost:54000', Hello.new)
while true
	sleep 1
end
