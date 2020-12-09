
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
        Freshies::API.new

        input = $prompt.select("Which Ski Area Do You Want To Check?", LOCATIONS)

        current_response_for(input)
        
        # system "clear"
    end

    def current_response_for(input)
        object = Freshies::Current.find_by_name(input)
        print_current_for(object[0])
    end

    def print_current_for(city)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "             #{city.name} Ski Resort               ".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "Here's today's weather for #{city.name} at #{city.time}"
        puts "The sunrise is at #{Time.at(city.sunrise).strftime('%I:%M %p')}"
        puts "The sunset is at #{Time.at(city.sunset).strftime('%I:%M %p')}"
        puts "-----------------------------------------------"
        puts "The current temperature in #{city.name} is #{city.temp}°F"
        puts "With windchill, it feels like #{city.feels_like}°F"
        puts "There is #{city.humidity}% humidity."
        puts "-----------------------------------------------"
        puts "There is currently #{city.weather[0]["main"]} conditions."
        puts "The visibility is #{city.visibility}m, with a UV index of #{city.uvi}"
        puts "The wind is blowing #{city.wind_speed}mph"
        puts "-----------------------------------------------"
        sleep(2)
        if city.weather[0]["main"] == "Snow"
            puts "YOU FOUND THE FRESHIES!!!".colorize(:light_blue)
            puts "-----------------------------------------------"
        else
            puts "SORRY, THERE'S NO FRESHIES in #{city.name} TODAY".upcase.colorize(:light_blue)
        end

    end

    def print_future_for(city)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "             #{@name} 7 Day Forecast           ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "Day     Date   Time     Temp Min/Max   Conditions"
        sleep(3)
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