class Freshies::Future

        def initialize(name, date, min, max, conditions)
            @name = name
            @date = date
            @min = min
            @max = max
            @conditions = conditions
            print
        end

        def print
            puts "_______________________________________________".colorize(:light_blue)
            puts "#{Time.at(@date).strftime('%A %m-%d %I:%M %p')}\t#{@min}°F\t#{@max}°F\t#{@conditions}"
            if @conditions == "Snow"
                puts "FRESHIES FORECASTED FOR #{Time.at(@date).strftime('%A').upcase}".colorize(:light_blue)
            end
            sleep(2)
        end

end
