class Bike
  attr_writer :maintenance_flag

  def initialize
    @maintenance_flag = false
  end
    
  def working?
    !@maintenance_flag
  end

end
