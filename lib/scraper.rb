
class Scraper

    MLB = "https://www.mlb.com/"
    ROSTER = "http://m.mlb.com/chc/roster/"
    
    def self.scrape_cubs_roster
        html = open(ROSTER)
        doc = Nokogiri::HTML(html)
            # binding.pry
            team_roster = doc.css(".dg-name_display_first_last")
            team_roster.each do |player|
            if player.css("a").attr("href") != nil
                player_info = player.css(".dg-name_display_first_last").text.strip
                url = player.css("a").attr("href").value
            end
            if url != nil
                player_name = Players.new(player_info, url)
                player_name.save
            end
        end
    end

    def self.scrape_profile(player)
        html = open(MLB + player.url)
        doc = Nokogiri::HTML(html)
        player.full_name = doc.css('.full-name')[0].text
        player.position = doc.css('.player-jumbotron-vitals--attr')[0].text.strip
        player.height = doc.css('.player-jumbotron-vitals--attr')[1].text.strip
        player.weight = doc.css('.player-jumbotron-vitals--attr')[2].text.strip
        player.age = doc.css('.player-jumbotron-vitals--attr')[3].text.strip
        player.bio = doc.css('.bio__short').text.strip
    end        
end
