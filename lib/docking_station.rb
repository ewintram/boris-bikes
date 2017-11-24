require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "Sorry, no bikes." if empty?
    fail "All bikes broken" if !@docked_bikes.last.working?
    @docked_bikes.pop
  end

  def dock(bike, working = bike.working?)
    fail "Sorry, no more capacity." if full?
    bike.working = working
    @docked_bikes.push(bike)
    @docked_bikes.last
  end

  private

  def full?
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.length == 0
  end
end
