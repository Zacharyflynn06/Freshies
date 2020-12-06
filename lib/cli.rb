
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

        if input = "Breckenridge"
            
        end


    end

    def goodbye
        puts "Thanks for using Freshies!"
        puts "Enjoy the Snow!"
    end

end