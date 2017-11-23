require "docking_station.rb"
describe DockingStation do
  it {is_expected.to respond_to(:dock).with(1).argument}

  it "should return relased bike when called" do
    expect(subject.release_bike).to be_a_kind_of(Bike)
  end

  it "should return bike when called" do
    expect(subject.dock(@bike)).to eq @bike
  end

  it { is_expected.to respond_to(:docked_bike)}
end
