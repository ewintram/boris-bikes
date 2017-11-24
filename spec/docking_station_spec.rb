require "docking_station"

describe DockingStation do

let(:bike) { double :bike, working?: true, :working= => nil }

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

  describe '#release_bike' do
    it "should return relased bike when called and there is a bike" do
      subject.dock(bike)
      expect(subject.release_bike).to be_a_kind_of(bike.class)
    end
    it "raise an error when #release_bike is called but there are no bikes" do
      expect {subject.release_bike}.to raise_error("Sorry, no bikes.")
    end
    it "raises an error when #release_bike is called but the bike is broken" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error("All bikes broken")
    end
  end

  describe '#dock' do
    it {is_expected.to respond_to(:dock).with(1).argument}
    it "should return the docked bike when called" do
      expect(subject.dock(bike)).to eq bike
    end
    it "should be possible to report whether a bike is working when docking" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike,false)
      expect(subject.docked_bikes.first.working?).to eq false
    end
    it "should raise an error if there is no more capacity for bikes" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error("Sorry, no more capacity.")
    end
  end

  describe '#docked_bike' do
    it { is_expected.to respond_to(:docked_bikes)}
  end
end
