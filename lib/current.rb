class Freshies::Current

    def initialize(name, current_hash)
        @name = name
        @conditions = current_hash["weather"][0]["main"]
        current_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @time = Time.at(@dt).strftime('%I:%M %p')
        print

        # binding.pry

    end

    def print
        puts "-----------------------------------------------"
        puts "Heres the current weather today in #{@name} at #{@time}"
        puts "The sun will rise at #{Time.at(@sunrise).strftime('%I:%M %p')}"
        puts "-----------------------------------------------"
        #sleep(2)
        puts "The current temperature in #{@name} is #{@temp}°F"
        puts "With windchill, it feels like #{@feels_like}°F"
        puts "There is #{@humidity}% humidity."
        puts "-----------------------------------------------"
        #sleep(2)
        puts "There is currently #{@conditions} conditions."
        puts "The visibility is #{@visibility}m, with a UV index of #{@uvi}"
        puts "The wind is blowing #{@wind_speed}mph"
        puts "-----------------------------------------------"
        #sleep(2)
        if @conditions == "Snow"
            puts "-----------------------------------------------"
            puts "YOU FOUND THE FRESHIES!!!".colorize(:light_blue)
            puts "-----------------------------------------------"
        else
            puts "-----------------------------------------------"
            puts "SORRY, THERE'S NO FRESHIES in #{@name} TODAY".upcase.colorize(:light_blue)
            puts "-----------------------------------------------"
        end
    end
end