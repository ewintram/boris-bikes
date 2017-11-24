require "docking_station"

describe DockingStation do

  describe '#initialize' do
    it 'should not raise an error if DockingStation is initialized with 1 argument' do
      expect {DockingStation.new(20)}.not_to raise_error
    end

    it 'should ensure that the default capacity is set to 20 if no argument is given' do
      expect(subject.capacity).to eq 20
    end

    it 'should allow the user to set a capacity' do
      expect(DockingStation.new(30).capacity).to eq 30
    end
  end

  describe '#request_bike' do
    it "should create a new bike when called" do
      expect(subject.request_bike).to be_a_kind_of(Bike)
    end
  end

  describe '#release_bike' do
    it "should return relased bike when called and there is a bike" do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_a_kind_of(Bike)
    end
    it "raise an error when #release_bike is called but there are no bikes" do
      expect {subject.release_bike}.to raise_error("Sorry, no bikes.")
    end
  end

  describe '#dock' do
    it {is_expected.to respond_to(:dock).with(1).argument}
    it "should return the docked bike when called" do
      expect(subject.dock(@bike)).to eq @bike
    end

    it "should raise an error if there is no more capacity for bikes" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
      expect{subject.dock(@bike)}.to raise_error("Sorry, no more capacity.")
    end
  end

  describe '#docked_bike' do
    it { is_expected.to respond_to(:docked_bikes)}
  end
end
