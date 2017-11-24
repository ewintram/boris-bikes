require "bike.rb"
describe Bike do
	it "can set working to be equal to true or false" do
		subject.working= false
		expect(subject.working?).to eq false
	end 
	it "should work from new" do
	expect(subject.working?).to eq true
	end 

  it {is_expected.to respond_to :working?}
end
