class Freshies::API
    INITIAL_URL = "http://api.openweathermap.org/data/2.5/weather?"

    def forecast(name, zipcode)
        @name = name
        forecast_uri = forecast_uri_for(zipcode)
        response = Net::HTTP.get_response(forecast_uri)
        data = JSON.parse(response.body)
        create_new_forecast(data)
        binding.pry
    end

    def create_new_forecast(data)
        Freshies::Current.new(
            data["dt"], #date
            @name, #name attribute
            data["main"]["temp"], #temperature attribute
            data["main"]["feels_like"], #feels like
            data["weather"][0]["main"], #conditions
            data["weather"][0]["description"] #sky
        )
    end

    def forecast_uri_for(zipcode)
        parameters = {
            units: "imperial",
            appid: "#{ENV['API_KEY']}",
            zip: zipcode,
        }
        uri = URI(INITIAL_URL)
        uri.query = URI.encode_www_form(parameters)
        uri
    end
end


    # def initialize(name, zipcode)
    #     @url = "http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&units=imperial&appid=#{ENV['API_KEY']}"
    # end

    # def fetch
    #     uri = URI.parse(@url)
    #     response = Net::HTTP.get_response(uri)
    #     data = JSON.parse(response.body)
    #     Freshies::Current.new(
    #         data["dt"], #date
    #         name, #name attribute
    #         data["main"]["temp"], #temperature attribute
    #         data["main"]["feels_like"], #feels like
    #         data["weather"][0]["main"], #conditions
    #         data["weather"][0]["description"] #sky
    #     )
    #     # binding.pry
    # end


    #@five_day_url = "https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=39.4803&lon=106.0667&dt=1607220921&appid=c6844bf64f629ac239ef509eaf7e12c3"
