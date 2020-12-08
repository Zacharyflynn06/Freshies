class Freshies::API
    INITIAL_URL = "http://api.openweathermap.org/data/2.5/onecall?"

    def forecast(name, lat, lon)
        @name = name
        uri = forecast_uri_for(lat, lon)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        create_new_current(data)
        create_new_future(data)
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
    end

    def create_new_current(data)
        Freshies::Current.new(@name, data["current"])
    end

    def create_new_future(data)
        data["daily"].each do |day|
            Freshies::Future.new(
                @name, #name
                day["dt"], #date
                day["temp"]["min"], #min
                day["temp"]["max"], #max
                day["weather"][0]["main"]#conditions
            )
        end
    end
end