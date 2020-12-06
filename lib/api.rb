class Freshies::API

    def initialize(zipcode)
        @url = "http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&units=imperial&appid=#{ENV['API_KEY']}"
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        Freshies::Current.new(
            data["name"], #name attribute
            data["main"]["temp"], #temperature attribute
            data["main"]["feels_like"], #feels like
            data["weather"][0]["main"], #conditions
            data["weather"][0]["description"] #sky
        )
        # binding.pry
    end


    #@five_day_url = "https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=39.4803&lon=106.0667&dt=1607220921&appid=c6844bf64f629ac239ef509eaf7e12c3"

end 