class Freshies::Current

    @@all = []

    attr_accessor :name

    def initialize(name, attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end 
        self.name = name.to_s.gsub("_", " ")
        save
    end
     
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        all.select {|x| x.name == name}
    end
end