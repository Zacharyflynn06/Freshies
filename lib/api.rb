class Freshies::API
    INITIAL_URL = "http://api.openweathermap.org/data/2.5/onecall?"

    def forecast(name, lat, lon)
        @name = name
        uri = forecast_uri_for(lat, lon)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)

        # binding.pry
        create_new_current(data)
        # create_new_future(data)

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
        current_hash = data["current"]
        Freshies::Current.new(@name, current_hash)
    end

    def create_new_future

end