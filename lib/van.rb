class Van
	def cargo= cargo
		@cargo = cargo
	end

	def deliver
		cargo =@cargo
		@cargo = []
		cargo
	end
end