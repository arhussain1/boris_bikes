require "docking_station"

describe DockingStation do 

    it { is_expected.to respond_to :release_bike }
    it "returns a bike instance" do
      subject.return_bike(Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end

    it ":release_bike should raise and error when the docking station is empty" do
      expect { subject.release_bike }.to raise_error("There are no bikes available")
    end

    it ":return_bike should raise and error when the docking station is empty" do
      subject.return_bike(Bike.new)
      expect { subject.return_bike(Bike.new) }.to raise_error("There is already a bike here")
    end

    it "test if output of Bike instance responds to working? method" do
      expect(Bike.new).to respond_to(:working?)
    end

    it ":return_bike should return the bike instance that was docked" do
      bike = Bike.new
      expect(subject.return_bike(bike)).to eq(bike)
    end

    it { is_expected.to respond_to :bike }

    it "" do
      bike = Bike.new
      subject.return_bike(bike)
      expect(subject.bike).to eq(bike)
    end

end
