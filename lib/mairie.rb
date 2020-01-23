require 'nokogiri'
require 'rspec'
require 'byebug'
require 'open-uri'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end




def get_townhall_urls(area_url)
	page = Nokogiri::HTML(open(area_url))
	villes = page.xpath("//tr/td[1]/p/a/@href")
	town_names = page.xpath("//tr/td[1]/p/a")
	townhall_urls = []
	names_array = []

	town_names.each do |t|
		names_array << t.text
	end

	villes.each do |v|
		townhall_urls << "http://annuaire-des-mairies.com" + v.text.sub(".","")
	end	


	result = []

	for i in 0..townhall_urls.length-1
		result << { names_array[i] => get_townhall_email(townhall_urls[i])}
	end

	puts result
end

get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")






