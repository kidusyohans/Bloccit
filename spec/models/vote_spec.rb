require 'rails_helper'

describe Vote do
	describe "validations" do
		
		it "accepts 1 as a value" do
			vote = Vote.new(value: 1)
			expect(vote).to be_valid
		end
		
		it "accepts -1 as a value" do
			vote = Vote.new(value:-1)
			expect(vote).to be_valid
		end
		
		it "does not accespt invalid values" do
			vote = Vote.new(value: 0)
			expect(vote).to be_invalid
		end
	end
end