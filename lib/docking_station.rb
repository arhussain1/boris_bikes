require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    return @bikes.pop unless empty?
    raise Exception.new "There are no bikes available"
  end

  def return_bike(bike, working=true)
    raise Exception.new "Capacity is full" if full?
    @bikes.push(bike)

    working ? bike.working : bike.broken

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