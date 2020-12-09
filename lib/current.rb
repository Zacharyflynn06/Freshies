class Freshies::Current

    @@all = []

    attr_accessor :name, :time

    def initialize(name, attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        @time = Time.at(self.dt).strftime('%I:%M %p')
        @name = name.to_s.gsub("_", " ")
        save
    end
    
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select {|x| x.name == name}
    end
end