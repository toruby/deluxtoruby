require 'drb/drb'

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:54320')
while true
	p queue.pop
	sleep(rand)
end
