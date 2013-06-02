require 'drb/drb'

DRb.start_service
ro = DRbObject.new_with_uri('druby://localhost:54321')

key = 0
while true
  key, obj = ro.receive(key + 1)
  p [key, obj]
  sleep(3)
end
