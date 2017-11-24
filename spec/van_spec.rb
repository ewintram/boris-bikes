require 'van'

describe Van do
	it 'should collect an array of bikes' do
		expect(subject).to respond_to(:cargo=).with(1).argument 
	end
	it 'should deliver an array of bikes' do
		subject.cargo = [:bike,:bike,:bike]
		expect(subject.deliver).to eq [:bike,:bike,:bike]
	end
end

