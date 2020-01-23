require_relative '../lib/scrapper'

describe "scrapper_from_html" do
	it "test that the method returns values " do
		expect(scrapper_from_html()).not_to be_nil
	end
end


describe "perform" do
	it "test that the method returns an array " do
		expect(perform()).to be_an(Array)
	end

	it "test that the method returns at least 10 entries " do
		expect(perform.length).to be > 10
	end

	it "test that the method returns specific entries " do
		expect(perform.reduce({}, :merge)).to include("BTC")
		expect(perform.reduce({}, :merge)).to include("ETH")
	end
end