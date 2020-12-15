class Freshies::Day
    #belongs to forecast

    @@all = []

    attr_accessor :forecast

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        save
    end
 
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.hottest_day
        all.sort_by {|day| day.temp["day"]}.last
        # binding.pry
    end

end