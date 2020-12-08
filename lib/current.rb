class Freshies::Current

    @@all = []

    def initialize(name, current_hash)
        current_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @name = name
        @conditions = current_hash["weather"][0]["main"]
        @time = Time.at(@dt).strftime('%I:%M %p')
        save
        print

        # binding.pry
    end
    def save
        @@all << self
    end

    def print
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "             #{name} Ski Resort               ".colorize(:light_blue)
        puts "_______________________________________________".colorize(:light_blue)
        sleep (3)
        puts ""
        puts "Here's today's weather for #{@name} at #{@time}"
        puts "The sunrise is at #{Time.at(@sunrise).strftime('%I:%M %p')}"
        puts "The sunset is at #{Time.at(@sunset).strftime('%I:%M %p')}"
        puts "-----------------------------------------------"
        sleep(2)
        puts "The current temperature in #{@name} is #{@temp}°F"
        puts "With windchill, it feels like #{@feels_like}°F"
        puts "There is #{@humidity}% humidity."
        puts "-----------------------------------------------"
        sleep(2)
        puts "There is currently #{@conditions} conditions."
        puts "The visibility is #{@visibility}m, with a UV index of #{@uvi}"
        puts "The wind is blowing #{@wind_speed}mph"
        puts "-----------------------------------------------"
        sleep(2)
        if @conditions == "Snow"
            puts "YOU FOUND THE FRESHIES!!!".colorize(:light_blue)
            puts "-----------------------------------------------"
        else
            puts " SORRY, THERE'S NO FRESHIES in #{@name} TODAY".upcase.colorize(:light_blue)
        end
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "             #{@name} 7 Day Forecast           ".colorize(:blue)
        puts "_______________________________________________".colorize(:light_blue)
        puts ""
        puts "Day     Date   Time     Temp Min/Max   Conditions"
        sleep(3)
    end
end