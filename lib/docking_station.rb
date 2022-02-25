require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    bike_index = working_bike_index
    raise Exception.new "There are no bikes available" unless bike_index
    get_bike(bike_index)
  end

  def return_bike(bike, is_broken=false)
    raise Exception.new "Capacity is full" if full?
    @bikes.push(bike)
    bike.maintenance_flag = is_broken
    return bike
  end

  private

  def empty?
    @bikes.length == 0
  end

  def full?
    @bikes.length == @capacity
  end

  def working_bike_index
    @bikes.index {|bike| bike.maintenance_flag == false}
  end

  def get_bike(index)
    @bikes.delete_at(index)
  end

end