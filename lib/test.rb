require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    crypto_name = []
    crypto_price = []


page.xpath("//*/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div").each do |i| 

   crypto_name.push(i.content)


end

page.xpath("//*/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[5]/div/a/span").each do |y|

    crypto_price.push(y.content)

end

crypto = Hash[crypto_name.zip(crypto_price)]

puts crypto