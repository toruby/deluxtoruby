require 'rinda/tuplespace'
require 'drb/drb'

class Notifier
  def initialize
    @ts = Rinda::TupleSpace.new
    @ts.write([:tail, 0])
  end
  
  def notify(it)
    tuple = @ts.take([:tail, nil])
    tail = tuple[1] + 1
    @ts.write([tail, it])
    @ts.write([:tail, tail])
    tail
  end
  
  def recieve(key)
    @ts.read([key, nil])
  end
end

DRb.start_service('druby://loacalhost:54321', Notifier.new)
while true
  sleep 1
end


