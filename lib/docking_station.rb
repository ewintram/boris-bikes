require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def request_bike
    Bike.new
  end

  def release_bike
    fail "Sorry, no bikes." if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail "Sorry, no more capacity." if full?
    @docked_bikes.push(bike)
    @docked_bikes.last
  end

  private

  def full?
    @docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.length == 0
  end
end
