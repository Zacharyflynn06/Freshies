
class Freshies::CLI

        @zips = [80501]
                # 80424, 
                # 81435,
                # 81224,
                # 81657,
                # 81611,
                # 80477,
                # 80443,
                # 80482,
                # 81620]

    def self.fetch_all
        @zips.each {|zip| Freshies::API.new(zip)}
    end
            
    $prompt = TTY::Prompt.new

    

    def run
        self.welcome
        self.menu
        # self.goodbye
    end

    def welcome


        puts "Welcome to Freshies!"
        puts "Lets find the freshest snow!"
    end

    def menu
        locations = ["Breckenridge",
                    "Telluride",
                    "Keystone",
                    "Crested Butte", 
                    "Vail",
                    "Aspen",
                    "Steamboat",
                    "Copper",
                    "Winter Park",
                    "Beaver Creak"
                    ]
        

        input = $prompt.select("Which Ski Area Do You Want To Check?", locations, cycle: true)

        # while input != "exit"

        if input == "Breckenridge"
            x = Freshies::API.new.forecast("Breckenridge", 39.4803, -106.066)
            x.print   
        elsif input == "Telluride"
            x = Freshies::API.new.forecast("Telluride", 37.9363, -107.8466)
            x.print
        elsif input ==  "Keystone"
            x = Freshies::API.new.forecast("Keystone", 39.6084, -105.9437)
            x.print
        elsif input ==  "Crested Butte"
            x = Freshies::API.new.forecast("Crested Butte", 38.8697, -106.9878)
            x.print
        end


    end

    def goodbye
        puts "Thanks for using Freshies!"
        puts "Enjoy the Snow!"
    end

end