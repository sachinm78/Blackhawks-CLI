
class Cli

    def run
        header
        
        puts ""
        puts "Here is a list of current players.".colorize(:color => :white, :background => :red).bold
        puts ""
        
        Scraper.scrape_blackhawks_roster
        display_player_names
        
        puts ""
        menu                   
    end

    def display_player_names
        Players.all.each.with_index(1) do |name, index|
            puts "  #{index}. #{name.name}".bold
        end
    end

       
    def menu
        puts "Please enter a number from the list below for more information.".colorize(:color => :white, :background => :red).bold
        
        input = gets.chomp
        
        player = Players.all[input.to_i - 1]
            if !player 
                puts "Invalid entry.  Please try again.".colorize(:color => :white, :background => :red).bold
                puts ""
                
                display_player_names
                puts ""
                menu
            else
                Scraper.scrape_profile(player)
                puts ""
                puts "Here are the details for #{player.full_name}".colorize(:color => :white, :background => :red).bold
                puts ""
                puts "Position: #{player.position},   Age: #{player.age}".colorize(:color => :white, :background => :red).bold
                puts ""
                puts "Height: #{player.height},   Weight: #{player.weight}".colorize(:color => :white, :background => :red).bold
                puts ""
                puts "Bio:".colorize(:color => :white, :background => :red).bold
                puts ""
                puts "#{player.bio}".colorize(:color => :white, :background => :red).bold
                puts ""
                
                choice
            end
    end
    
    def choice
        puts ""
        puts ""
        puts "Would you like to see another player's info? (y/n)".colorize(:color => :white, :background => :red).bold
        
        input = gets.chomp
        if input == "y"
            puts ""
            display_player_names
            puts ""
            menu
        elsif input == "n"
            puts "Thank you.  See you next time!".colorize(:color => :white, :background => :red).bold
            exit
        else 
            puts "Invalid entry.  Please try again.".colorize(:color => :white, :background => :red).bold
            puts ""
            display_player_names
            puts ""
            menu
        end
    end

    def header
        puts "|-------------------------------------------------------|".colorize(:color => :white, :background => :red).bold
        puts "|                                                       |".colorize(:color => :white, :background => :red).bold
        puts "|         Welcome to Chicago Blackhawks CLI!            |".colorize(:color => :white, :background => :red).bold
        puts "|                                                       |".colorize(:color => :white, :background => :red).bold
        puts "|-------------------------------------------------------|".colorize(:color => :white, :background => :red).bold
    end
end