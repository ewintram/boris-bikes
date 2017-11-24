class Bike
  def working?
    @working
  end
  attr_writer :working

  def initialize
  	@working = true
  end

end
