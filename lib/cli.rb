
class Freshies::CLI

   LOCATIONS_MENU = ["Breckenridge",
                 "Telluride",
                 "Keystone",
                 "Crested Butte", 
                 "Vail", 
                 "Aspen",
                 "Steamboat",
                 "Copper",
                 "Winter Park",
                 "Beaver Creek"]
            
    $prompt = TTY::Prompt.new

    def welcome
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  FRESHIES".colorize(:blue)
        puts ""
        puts "        Lets find the freshest snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  loading..."
        puts ""
        Freshies::API.new
    end

    def menu
        system "clear"
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  Main Menu                    ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        city_input = $prompt.select("Scroll down and select a Ski-Area to check its conditions!", LOCATIONS_MENU, per_page: 10)
        current_response_for(city_input)
        second_input = $prompt.yes?("Would you like to see a 7-day forecast?")
        if second_input
            forecast_response_for(city_input)
            check_again
        else
            check_again
        end
    end

    def current_response_for(city)
        current_object = Freshies::Current.find_by_name(city)
        print_current_for(current_object[0])
    end

    def forecast_response_for(city)
        forecast_object = Freshies::Forecast.find_by_name(city)
        print_forecast_for(forecast_object)
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
            puts "           YOU FOUND THE FRESHIES".colorize(:light_blue)
            puts "-----------------------------------------------"
        else
            puts "SORRY, THERE'S NO FRESHIES in #{city.name} TODAY".upcase.colorize(:light_blue)
        end
    end

    def print_forecast_for(data)
        system "clear"
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "          #{data[0].forecast.name} 7 Day Forecast           ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "Day     Date   Time     Temp Min/Max   Conditions"
        puts "_______________________________________________".colorize(:light_blue)
        data.each do |day|
            puts "#{Time.at(day.dt).strftime('%A %m-%d %I:%M %p')} / #{day.temp["min"]}°F / #{day.temp["max"]}  / #{day.weather[0]["main"]} / #{day.humidity}%"
            if day.weather[0]["main"] == "Snow"
                puts "FRESHIES forecasted for #{Time.at(day.dt).strftime('%A').upcase}!".colorize(:blue)
            else
                puts "Sorry, no" + " FRESHIES ".colorize(:blue) + "on #{Time.at(day.dt).strftime('%A')}"
            end
        end
    end

    def goodbye
        system "clear"
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                 Thanks for using".colorize(:light_blue)
        puts "                     FRESHIES".colorize(:light_blue)
        puts "                  Enjoy the Snow".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        sleep(3)
        clear_screen
        puts "Goodbye"
        clear_screen
    end

    def clear_screen
        system "clear"
    end

    def check_again 
        input = $prompt.yes?("Do you want to check another city?")
        if input
            menu
        else
            goodbye
        end
    end

    def run
        system "clear"
        welcome
        input = $prompt.yes?("Do you want to find the FRESHIES?")
        if input
            system "clear"
            menu
        end
    end    
end