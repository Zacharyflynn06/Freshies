class Freshies::Current

    attr_reader :name, :temp, :feels_like, :conditions, :sky

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

    def print

        puts "Today in #{@name}"
        sleep(2)
        puts "-----------------------------------------------"
        sleep(2)
        puts "The current temperature in #{@name} is #{@temp}°F"
        sleep(2)
        puts "-----------------------------------------------"
        puts "with windchill, it feels like #{@feels_like}°F"
        sleep(2)
        puts "-----------------------------------------------"
        sleep(2)
        puts "There is a #{@sky}, and #{@conditions} conditions."
        puts "-----------------------------------------------"
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