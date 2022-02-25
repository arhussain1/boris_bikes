require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    return @bikes.pop unless empty?
    raise Exception.new "There are no bikes available"
  end

  def return_bike(bike)
    raise Exception.new "Capacity is full" if full?
    @bikes.push(bike)
    return bike
  end
  private
  def empty?
    @bikes.length == 0
  end
  def full?
    @bikes.length == @capacity
  end


end