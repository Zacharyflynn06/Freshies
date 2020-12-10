#has many Days

class Freshies::Forecast

    attr_accessor :city

    def initialize(city, data)
        @city = city.to_s
        create_days(data)
    end

    def create_days(data)
        data.each do |day|
            x = Freshies::Day.new(day)
            x.forecast = self
        end
    end 

    def self.find_by_name(name)
        Freshies::Day.all.select {|day| day.forecast.city == name}
    end
    
    # def print
    #     puts "_______________________________________________".colorize(:light_blue)
    #     puts "#{Time.at(@date).strftime('%A %m-%d %I:%M %p')} #{@min}°F/#{@max}°F #{@conditions}"
    #     if @conditions == "Snow"
    #         puts "FRESHIES FORECASTED FOR #{Time.at(@date).strftime('%A').upcase}".colorize(:light_blue)
    #     end
    # end

end
