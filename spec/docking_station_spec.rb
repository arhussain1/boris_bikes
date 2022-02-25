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

    it "test if output of Bike instance responds to working? method" do
      expect(Bike.new).to respond_to(:working?)
    end

    it ":return_bike should return the bike instance that was docked" do
      bike = Bike.new
      expect(subject.return_bike(bike)).to eq(bike)
    end

    it ":release bike releases a bike and the array decreases by one" do
      returned_bike = subject.return_bike(Bike.new)
      expect(subject.release_bike).to eq(returned_bike)
    end

    it "raises an error when capacity is full and :return_bike is called" do
      20.times{subject.return_bike(Bike.new)}
      expect {subject.return_bike(Bike.new)}.to raise_error("Capacity is full")
    end

    it ":return_bike should not raise an error when capacity is less than 20" do
      19.times{subject.return_bike(Bike.new)}
      expect {subject.return_bike(Bike.new)}.to_not raise_error
    end

    it "should not raise an error when capacity is 14 and 14 bikes are returned" do
      docking_station = DockingStation.new(14)
      expect do
        14.times { docking_station.return_bike(Bike.new) }
      end.to_not raise_error
    end

    it "should raise an error when capacity is 14 and 15 bikes are returned" do
      docking_station = DockingStation.new(14)
      expect do 
        15.times { docking_station.return_bike(Bike.new) }
      end.to raise_error("Capacity is full")
    end
    
    it "should set capacity of bikes to a default of 20 bikes" do
      expect do 
        20.times { subject.return_bike(Bike.new) }
      end.to_not raise_error
    end

    it ":return_bike(working=false) should return a bike that is not working" do
      bike = Bike.new
      broken_bike = subject.return_bike(bike, false)
      expect(broken_bike.working?).to eq(false)
    end

    it ":return_bike(working=true) should return a bike that is working" do
      bike = Bike.new
      working_bike = subject.return_bike(bike)
      expect(working_bike.working?).to eq(true)
    end
end
