require 'nokogiri'
require 'rspec'
require 'byebug'
require 'open-uri'

def scrapper_from_html
	url = "https://coinmarketcap.com/all/views/all/"
	page = Nokogiri::HTML(open(url))
	crypto = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[position()<500]/td[3]/div')
	value = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[position()<500]/td[5]/a')
	
	return crypto, value
end



def array(crypto, value)
	crypto_name_array = []
	value_name_array = []

	crypto.each do |c| 
		crypto_name_array << c.text
	end

	value.each do |v|
		value_name_array << v.text.gsub(/[$]/,'')
	end

	return crypto_name_array, value_name_array
end


def result(crypto_name_array, value_name_array)
	result = []
	for i in 0..crypto_name_array.length-1
		result << {crypto_name_array[i] => value_name_array[i]}
	end
	return result
end

def perform
	(crypto, value) = scrapper_from_html 
	(crypto_name_array, value_name_array) = array(crypto, value)
	result = result(crypto_name_array, value_name_array)
	return result
	puts result
end

perform
