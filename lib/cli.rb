
require 'pry'


class Cli

    def run
        puts "Welcome to Chicago Blackhawks CLI!"
        puts "Here is a list of current players."
        puts ""
        Scraper.scrape_blackhawks_roster
        display_player_names
        puts ""
        menu                   
    end

    def display_player_names
             
        Players.all.each.with_index(1) do |name, index|
            puts "  #{index}. #{name.name}"
        end
    end

        # Players.all.each.with_index(1) do |initial, name, index|
        #     puts "  #{index}. #{initial} #{name.name}"
        # end


    def menu
        puts "Please enter a number from the list below for more information."
        input = gets.chomp
        player = Players.all[input.to_i - 1]
            if !player
                puts "Invalid entry.  Please try again."
                puts ""
                display_player_names
                puts ""
                menu  
            else
                Scraper.scrape_profile(player)
                puts ""
                puts "      Here are the details for #{player.full_name}"
                puts ""
                puts "      Position: #{player.position},   Age: #{player.age}"
                puts ""
                puts "      Height: #{player.height},   Weight: #{player.weight}"
                puts ""
                puts "      Bio:"
                puts ""
                puts "#{player.bio}"
                puts "
                "
                display_player_names
                puts ""
                choice
            end
    end
    
    def choice
        puts "Would you like to see another player's info? (y/n)"
        input = gets.chomp
            if input == "y"
                puts ""
                display_player_names
                puts ""
                menu
            elsif input == "n"
                puts "Thank you.  See you next time!"
                exit
            else 
                puts "Invalid entry.  Please try again."
                puts ""
                display_player_names
                puts ""
                menu
            end
    end
end