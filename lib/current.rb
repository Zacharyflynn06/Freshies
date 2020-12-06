class Freshies::Current

    attr_reader :name, :temp, :conditions

    @@all = []

    def initialize(name, temp, feels_like, conditions, sky)
        # attributes.each do |k,v|
        #     self.class.attr_reader(k)
        # end
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

end