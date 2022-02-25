require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    return @bikes.pop if @bikes.length > 0
    raise Exception.new "There are no bikes available"
  end

  def return_bike(bike)
    raise Exception.new "Capacity is full" if @bikes.length >= @capacity
    @bikes.push(bike)
    return bike
  end

end