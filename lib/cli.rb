
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
        puts "            Welcome to Freshies!"
        puts "        Lets find the freshest snow!"
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
    end

    def menu
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  Main Menu                    "
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

        input = $prompt.select("Which Ski Area Do You Want To Check?", LOCATIONS, )
        
        if input == "Breckenridge"
            x = Freshies::API.new.forecast("Breckenridge", 39.4803, -106.066)
            x.print   
        elsif input == "Telluride"
            x = Freshies::API.new.forecast("Telluride", 37.9363, -107.8466)
            x.print
        elsif input ==  "Keystone"
            x = Freshies::API.new.forecast("Keystone", 39.6084, -105.9437)
            x.print
        elsif input ==  "Crested Butte"
            x = Freshies::API.new.forecast("Crested Butte", 38.8697, -106.9878)
            x.print
        elsif input ==  "Vail"
            x = Freshies::API.new.forecast("Vail", 39.6403, -106.3742)
            x.print
        elsif input ==  "Aspen"
            x = Freshies::API.new.forecast("Aspen", 39.1911, -106.8175)
            x.print
        elsif input ==  "Steamboat"
            x = Freshies::API.new.forecast("Steamboat", 40.4572, -106.8045)
            x.print
        elsif input ==  "Copper"
            x = Freshies::API.new.forecast("Copper", 39.5022, -106.1497)
            x.print
        elsif input ==  "Winter Park"
            x = Freshies::API.new.forecast("Winter Park", 39.8917, -105.7631)
            x.print
        elsif input ==  "Beaver Creek"
            x = Freshies::API.new.forecast("Beaver Creek", 39.6042, -106.5165)
            x.print
        end
    end

    def goodbye
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "        Thanks for using Freshies"
        puts "               Enjoy the Snow"
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

    end
    def run
        self.welcome
        # sleep(5)
        self.menu
        input = $prompt.yes?("Do you want to check another Ski-Area?")
        while input
            self.menu
            input = $prompt.yes?("Do you want to check another city?")
        end 
        self.goodbye
    end

end