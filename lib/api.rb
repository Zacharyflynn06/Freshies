class Freshies::API

    def initialize (zipcode)
        @url = url = "http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&units=imperial&appid=#{ENV['API_KEY']}"
    end

    def fetch
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
        binding.pry
    end

end 