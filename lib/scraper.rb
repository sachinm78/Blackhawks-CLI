require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

    NHL = "https://www.nhl.com/"
    ROSTER = "https://www.nhl.com/blackhawks/roster"
    
    def self.scrape_blackhawks_roster
        html = open(ROSTER)
        doc = Nokogiri::HTML(html)
            team_roster = doc.css(".name-col")
            team_roster.each do |player|
            if player.css("a").attr("href") != nil
                player_info = player.css(".name-col__lastName").text.strip
                url = player.css("a").attr("href").value
            end
            if url != nil
                player_name = Players.new(player_info, url)
                player_name.save
            end
        end
    end

    def self.scrape_profile(player)
        html = open(NHL + player.url)
        doc = Nokogiri::HTML(html)
        player.full_name = doc.css('.player-bio__label')[0].text
        player.position = doc.css('.player-jumbotron-vitals--attr')[0].text.strip
        player.height = doc.css('.player-jumbotron-vitals--attr')[1].text.strip
        player.weight = doc.css('.player-jumbotron-vitals--attr')[2].text.strip
        player.age = doc.css('.player-jumbotron-vitals--attr')[3].text.strip
        player.bio = doc.css('.bio__short').text.strip
    end        
end
