require_relative '../lib/depute'

describe "deputy_list" do
	it "test that the method returns a Hash" do
		expect(deputy_list()).to be_an(Hash)
	end
end