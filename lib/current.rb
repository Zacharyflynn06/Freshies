class Freshies::Current

    # attr_reader :time, :name, :temp, :feels_like, :conditions

    @@all = []

    def initialize(name, current_hash)
        @name = name
        @conditions = current_hash["weather"][0]["main"]
        current_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @time = Time.at(@dt).strftime('%I:%M %p')
        save
    end

    def print
        puts "-----------------------------------------------"
        puts "Today in #{@name} at #{@time}"
        puts "-----------------------------------------------"
        puts "The current temperature in #{@name} is #{@temp}°F"
        puts "With windchill, it feels like #{@feels_like}°F"
        puts "There is #{@humidity}% humidity."
        puts "-----------------------------------------------"
        puts "There is currently #{@conditions} conditions."
        puts "The visibility is #{@visibility}m, with a UV index of #{@uvi}"
        puts "The wind is blowing #{@wind_speed}mph"
        puts "-----------------------------------------------"
        if @conditions == "Snow"
            puts "-----------------------------------------------"
            puts "YOU FOUND THE FRESHIES!!!"
            puts "-----------------------------------------------"
        else
            puts "-----------------------------------------------"
            puts "NO FRESHIES TODAY"
            puts "-----------------------------------------------"
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.delete_all
        @@all.clear
    end

end