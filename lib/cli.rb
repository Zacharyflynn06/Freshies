
class Freshies::CLI

    LOCATIONS = ["Breckenridge",
        "Telluride",
        "Keystone",
        "Crested Butte", 
        "Vail",
        "Aspen",
        "Steamboat",
        "Copper",
        "Winter Park",
        "Beaver Creak"  
    ]
            
    $prompt = TTY::Prompt.new

    def welcome
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  FRESHIES".colorize(:blue)
        sleep(2)
        puts "        Lets find the freshest snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
    end

    def menu
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  Main Menu                    ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

        input = $prompt.select("Which Ski Area Do You Want To Check?", LOCATIONS)
        
        if input == "Breckenridge"
            Freshies::API.new.forecast("Breckenridge", 39.4803, -106.066)
        elsif input == "Telluride"
            Freshies::API.new.forecast("Telluride", 37.9363, -107.8466)
        elsif input ==  "Keystone"
            Freshies::API.new.forecast("Keystone", 39.6084, -105.9437)
        elsif input ==  "Crested Butte"
            Freshies::API.new.forecast("Crested Butte", 38.8697, -106.9878)
        elsif input ==  "Vail"
            Freshies::API.new.forecast("Vail", 39.6403, -106.3742)
        elsif input ==  "Aspen"
            Freshies::API.new.forecast("Aspen", 39.1911, -106.8175)
        elsif input ==  "Steamboat"
            Freshies::API.new.forecast("Steamboat", 40.4572, -106.8045)
        elsif input ==  "Copper"
            Freshies::API.new.forecast("Copper", 39.5022, -106.1497)
        elsif input ==  "Winter Park"
            Freshies::API.new.forecast("Winter Park", 39.8917, -105.7631)
        elsif input ==  "Beaver Creek"
            Freshies::API.new.forecast("Beaver Creek", 39.6042, -106.5165)
        end
    end

    def goodbye
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "        Thanks for using Freshies,".colorize(:light_blue)
        puts "              Enjoy the Snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

    end

    def run
        welcome
        sleep(2)
        menu
        input = $prompt.yes?("Do you want to check another city?")
        while input
            menu
            input = $prompt.yes?("Do you want to check another city?")
        end 
        goodbye
    end

end