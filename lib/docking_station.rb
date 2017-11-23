require_relative 'bike'

class DockingStation
  attr_reader :docked_bike

  def request_bike
    Bike.new
  end

  def release_bike
    fail "Sorry, no bikes." unless @docked_bike
    @docked_bike
  end

  def dock(bike)
    fail "Sorry, no more capacity." if @docked_bike
    @docked_bike = bike
  end

end
