require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def request_bike
    Bike.new
  end

  def release_bike
    fail "Sorry, no bikes." if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail "Sorry, no more capacity." if @docked_bikes.length >= 20
    @docked_bikes.push(bike)
    @docked_bikes.last
  end

end
