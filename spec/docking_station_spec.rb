require "docking_station.rb"
describe DockingStation do

  it "should create a new bike when called" do
    expect(subject.request_bike).to be_a_kind_of(Bike)
  end

  it "should return relased bike when called and there is a bike" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_a_kind_of(Bike)
  end

  it "raise an error when #release_bike is called but there are no bikes" do
    expect {subject.release_bike}.to raise_error("Sorry, no bikes.")
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "should return bike when called" do
    expect(subject.dock(@bike)).to eq @bike
  end

  it { is_expected.to respond_to(:docked_bike)}

end
