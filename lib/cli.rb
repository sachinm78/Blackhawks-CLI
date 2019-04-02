
require 'pry'


class Cli

    def run
        puts "Welcome to Chicago Blackhawks CLI!"
        puts "Here is a list of current players."
        # puts "m = menu, e = exit"
        Scraper.scrape_blackhawks_roster
        display_player_names
        menu                   
    end

    def display_player_names
             
        Names.all.each.with_index(1) do |name, index|
            puts "#{index}. #{name.name}"
        end
    end

    def menu
        puts "Please enter a number from the list below for more information."
        input = gets.chomp

        player = Names.all[input.to_i - 1]
            if !player
                puts "Invalid entry.  Please try again."
                menu
            else
                Scraper.scrape_profile(player)
            end
    end
end

