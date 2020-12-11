class Freshies::Forecast
    #has many Days

    attr_accessor :name

    def initialize(name, data)
        @name = name.to_s.gsub("_", " ")
        create_days(data)
    end

    def create_days(data)
        data.each do |day|
            x = Freshies::Day.new(day)
            x.forecast = self
        end
    end 

    def self.find_by_name(name)
        Freshies::Day.all.select {|day| day.forecast.name == name}
    end
end
