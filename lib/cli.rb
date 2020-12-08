
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
                 "Beaver Creak"]
            
    $prompt = TTY::Prompt.new

    def welcome
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  FRESHIES".colorize(:blue)
        puts "        Lets find the freshest snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        sleep(2)
    end

    def menu
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  Main Menu                    ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

        

        input = $prompt.select("Which Ski Area Do You Want To Check?", LOCATIONS)
        
        system "clear"

        if input == "Breckenridge"
            Freshies::API.new
            # Freshies::API.new.current_forecast_for("Breckenridge", 39.4803, -106.066)
            Freshies::API.new.daily_forecast_for("Breckenridge", 39.4803, -106.066)
        elsif input == "Telluride"
            Freshies::API.new.current_forecast_for("Telluride", 37.9363, -107.8466)
            Freshies::API.new.daily_forecast_for("Telluride", 37.9363, -107.8466)
        elsif input ==  "Keystone"
            Freshies::API.new.current_forecast_for("Keystone", 39.6084, -105.9437)
            Freshies::API.new.daily_forecast_for("Keystone", 39.6084, -105.9437)
        elsif input ==  "Crested Butte"
            Freshies::API.new.current_forecast_for("Crested Butte", 38.8697, -106.9878)
            Freshies::API.new.daily_forecast_for("Crested Butte", 38.8697, -106.9878)
        elsif input ==  "Vail"
            Freshies::API.new.current_forecast_for("Vail", 39.6403, -106.3742)
            Freshies::API.new.daily_forecast_for("Vail", 39.6403, -106.3742)
        elsif input ==  "Aspen"
            Freshies::API.new.current_forecast_for("Aspen", 39.1911, -106.8175)
            Freshies::API.new.daily_forecast_for("Aspen", 39.1911, -106.8175)
        elsif input ==  "Steamboat"
            Freshies::API.new.current_forecast_for("Steamboat", 40.4572, -106.8045)
            Freshies::API.new.daily_forecast_for("Steamboat", 40.4572, -106.8045)
        elsif input ==  "Copper"
            Freshies::API.new.current_forecast_for("Copper", 39.5022, -106.1497)
            Freshies::API.new.daily_forecast_for("Copper", 39.5022, -106.1497)
        elsif input ==  "Winter Park"
            Freshies::API.new.current_forecast_for("Winter Park", 39.8917, -105.7631)
            Freshies::API.new.daily_forecast_for("Winter Park", 39.8917, -105.7631)
        elsif input ==  "Beaver Creek"
            Freshies::API.new.current_forecast_for("Beaver Creek", 39.6042, -106.5165)
            Freshies::API.new.daily_forecast_for("Beaver Creek", 39.6042, -106.5165)
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
        input = $prompt.yes?("Do you want to find the FRESHIES?")
        if input
            menu
        end
        input = $prompt.yes?("Do you want to check another city?")
        while input
            menu
            input = $prompt.yes?("Do you want to check another city?")
        end 
        goodbye
    end

end