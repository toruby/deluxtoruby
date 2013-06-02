require 'drb/drb'
require 'pp'

front = Hash.new
DRb.start_service('druby://localhost:54300', front)
while true
  sleep 10
  pp front
end
