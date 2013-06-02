require 'drb/drb'
require 'thread'

DRb.start_service('druby://localhost:54320', Queue.new)
while true
	sleep 1
end

