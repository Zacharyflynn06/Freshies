class Freshies::Current

    attr_reader :name, :temp, :conditions

    @@all = []

    def initialize(date, name, temp, feels_like, conditions, sky)
        @date = Time.at(date).strftime('%Y-%m-%d %I:%M %p')
        @name = name
        @temp = temp
        @feels_like = feels_like
        @conditions = conditions
        @sky = sky
        save
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