class Freshies::Future

    @@all = []

        def initialize(name, date, min, max, conditions)
            @name = name
            @date = date
            @min = min
            @max = max
            @conditions = conditions
            print
            save
        end

        def print
            puts "_______________________________________________".colorize(:light_blue)
            puts "#{Time.at(@date).strftime('%A %Y-%m-%d %I:%M %p')}\t#{@min}°F\t#{@max}°F\t#{@conditions}"
            if @conditions == "Snow"
                puts "YOU FOUND THE FRESHIES".colorize(:light_blue)
            end
        end

        def save
            @@all << self
        end
        
        def self.all
            @@all
        end

end
