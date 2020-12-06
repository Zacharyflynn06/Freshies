# taking care of displaying info - all of puts/pring statments
# takes care of user input - gets
class Freshies::CLI

    @zips = [80435,
            80424, 
            81435,
            81224,
            81657,
            81611,
            80477,
            80443,
            80482,
            81620]

    def self.fetch_all
        @zips.each do |zip|
            Freshies::API.new(zip)
            puts "hello"

        end
        binding.pry
    end
end

#  def run 
#      greeting
#      menu
#      goodbye


    # def greeting
    #     puts "Hello, lets find the freshies!"

    # end

    # def menu
    #     until input == "exit"

    #     end
    # end

    # def goodbye
    #     puts "Enjoy the Freshies!"
 
