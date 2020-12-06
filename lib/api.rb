class Freshies::API
    INITIAL_URL = "http://api.openweathermap.org/data/2.5/onecall?"

    def forecast(name, lat, lon)
        @name = name
        uri = forecast_uri_for(lat, lon)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)

        # binding.pry
        create_new_current(data)

    end

    def forecast_uri_for(lat, lon)
        parameters = {
            units: "imperial",
            appid: "#{ENV['API_KEY']}",
            lat: lat,
            lon: lon,
            exclude: "minutely"
        }
        uri = URI(INITIAL_URL)
        uri.query = URI.encode_www_form(parameters)
        uri

        # binding.pry
    end

    def create_new_current(data)
        Freshies::Current.new(
            data["current"]["dt"], #date
            @name, #name attribute
            data["current"]["temp"], #temperature attribute
            data["current"]["feels_like"], #feels like
            data["current"]["weather"][0]["main"], #conditions
        )
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
