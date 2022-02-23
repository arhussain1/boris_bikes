require "docking_station"

describe DockingStation do 
    release_bike = :release_bike
    it { is_expected.to respond_to release_bike }
end

