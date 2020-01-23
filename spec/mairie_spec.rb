require_relative '../lib/mairie'

describe "get_townhall_email" do
	it "returns a email address" do
		expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
	end

end

describe "get_townhall_urls" do
	it "returns a email address" do
		expect(get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")).to be_an(Array)
	end

end