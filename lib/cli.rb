
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
        puts "        Lets find the freshest snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  loading..."
        Freshies::API.new
        # binding.pry
        system "clear"
    end

    def menu
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "                  Main Menu                    ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

        input = $prompt.select("Which Ski Area Do You Want To Check?", LOCATIONS_MENU)

        response_for(input)
    end

    def response_for(city)
        current_object = Freshies::Current.find_by_name(city)
        print_current_for(current_object[0])
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
            puts "YOU FOUND THE FRESHIES!!!".colorize(:light_blue)
            puts "-----------------------------------------------"
        else
            puts "SORRY, THERE'S NO FRESHIES in #{city.name} TODAY".upcase.colorize(:light_blue)
        end

    end

    def print_forecast_for(data)
        data.each do |day|
            puts "#{Time.at(day.dt).strftime('%A %m-%d %I:%M %p')} / #{day.temp["min"]}°F / #{day.temp["max"]}  / #{day.weather[0]["main"]} / #{day.humidity}%"
        end
    end

    # def scratch
    #     puts "_______________________________________________".colorize(:light_blue)
    #     puts ""
    #     puts "             #{@name} 7 Day Forecast           ".colorize(:blue)
    #     puts "_______________________________________________".colorize(:light_blue)
    #     puts ""
    #     puts "Day     Date   Time     Temp Min/Max   Conditions"
    #     sleep(3)
        
    #     puts "_______________________________________________".colorize(:light_blue)
    #     # puts "#{city.data[0]["dt"]).strftime('%A %m-%d %I:%M %p')} #{@min}°F/#{@max}°F #{@conditions}"
    #     if @conditions == "Snow"
    #         puts "FRESHIES FORECASTED FOR #{Time.at(@date).strftime('%A').upcase}".colorize(:light_blue)
    #     end
    # end


    def goodbye
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "        Thanks for using Freshies,".colorize(:light_blue)
        puts "              Enjoy the Snow!".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""

    end

    def run
        system "clear"
        welcome
        input = $prompt.yes?("Do you want to find the FRESHIES?")
        if input
            menu
        else
            goodbye
        end
        input = $prompt.yes?("Do you want to check another city?")
        while input
            system "clear"
            menu
            input = $prompt.yes?("Do you want to check another city?")
        end 
        goodbye
    end
end