require "docking_station"

describe DockingStation do 
    it { is_expected.to respond_to :release_bike }
    it "returns a bike instance" do
      expect(DockingStation.new.release_bike).to be_instance_of(Bike)
    end
    it "test if output of release_bike method responds to working? method" do
      bike_instance = DockingStation.new.release_bike
      expect(bike_instance).to respond_to(:working?)
    end
end
