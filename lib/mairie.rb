require 'nokogiri'
require 'open-uri'

#begin puts "Entrez le numéro de votre département"
#num = gets.chomp 
#puts "entrez le nom de votre ville"
#city = gets.chomp 
#city.downcase!

#page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{num}/#{city}.html"))

#page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |i|
#    puts "voici l'adresse email de votre ville"
#    puts i.content
#end

townhall_url = "https://www.annuaire-des-mairies.com/95/avernes.html"
townhall_url2 = "https://www.annuaire-des-mairies.com/val-d-oise.html"
tab =[]
tab2 = []
tab3 = []

def get_townhall_email(townhall_url)
    url = Nokogiri::HTML(URI.open(townhall_url))
    return url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end



url2 = Nokogiri::HTML(URI.open(townhall_url2))
url2.css('.lientxt').each do |i|
tab.push((i['href']))
end

url2 = Nokogiri::HTML(URI.open(townhall_url2))
url2.css('.lientxt').each do |i|
tab3.push((i.content))
end



    tab.each do |y|
        mail = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{y}"))
        mail.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |k|
            tab2.push(k.content)
        end
    end

    hash = Hash[tab3.zip(tab2)]

    puts hash

    





















