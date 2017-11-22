require "docking_station.rb"
describe DockingStation do
  
  it "should return relased bike when called" do
    expect(subject.release_bike(@bike)).to eq bike
  end

  it "should return bike when called" do
    expect(subject.dock).to eq bike
  end
  attr_reader :bike
end
