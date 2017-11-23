require_relative 'bike'

class DockingStation
  attr_reader :docked_bike

  def request_bike
    Bike.new
  end

  def release_bike
    if self.docked_bike
      @docked_bike
    else
      fail "Sorry, no bikes."
    end
  end

  def dock(bike)
    @docked_bike = bike
  end

end
