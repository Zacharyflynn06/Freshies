class Freshies::Current

    attr_reader :time, :name, :temp, :feels_like, :conditions

    @@all = []

    def initialize(time, name, temp, feels_like, conditions)
        @time = Time.at(time).strftime('%Y-%m-%d %I:%M %p')
        @name = name
        @temp = temp
        @feels_like = feels_like
        @conditions = conditions
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
        puts "There is currently #{@conditions} conditions."
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