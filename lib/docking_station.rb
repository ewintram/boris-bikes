class DockingStation
  def release_bike(bike)
    @bike = bike
  end
  
  def dock
    @bike
  end
  
  attr_reader :bike
end
