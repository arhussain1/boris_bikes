require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    return @bike if @bike
    raise Exception.new "There are no bikes available"
  end

  def return_bike(bike)
    raise Exception.new "There is already a bike here" if @bike
    @bike = bike
  end

end