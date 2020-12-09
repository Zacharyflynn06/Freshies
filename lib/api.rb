class Freshies::API

    INITIAL = "http://api.openweathermap.org/data/2.5/onecall?"
    LOCATIONS = {:breckenridge => [39.4803, -106.0667],
                 :telluride => [37.9363, -107.8466],
                 :keystone => [39.6084, -105.9437],
                 :crested_butte => [38.8697, -106.9878],
                 :vail => [39.6403, -106.3742],
                 :aspen => [39.1911, -106.8175],
                 :steamboat => [40.4572, -106.8045],
                 :copper => [39.5022, -106.1497],
                 :winter_park => [39.8917, -105.7631],
                 :beaver_creek => [39.6042, -106.5165]}

    def initialize
        LOCATIONS.each do |k, v|
            current_forecast_for(k, v[0], v[1])
        end
    end

    def current_forecast_for(name, lat, lon)
        uri = forecast_uri_for(lat, lon)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        Freshies::Current.new(name.to_s.capitalize, data["current"])#name
                            # data["current"]["dt"], #time
                            # data["current"]["temp"], #temp
                            # data["current"]["feels_like"], #feels_like
                            # data["current"]["weather"][0]["main"], #conditions
                            # data["current"]["sunrise"],
                            # data["current"]["sunset"],
                            # )
                

    end

    # def daily_forecast_for(name, lat, lon)
    #     @name = name
    #     uri = forecast_uri_for(lat, lon)
    #     response = Net::HTTP.get_response(uri)
    #     data = JSON.parse(response.body)
    #     create_new_future(data)
    # end

    def forecast_uri_for(lat, lon)
        parameters = {
            units: "imperial",
            appid: "#{ENV['API_KEY']}",
            lat: lat,
            lon: lon,
            exclude: "minutely"
        }
        uri = URI(INITIAL)
        uri.query = URI.encode_www_form(parameters)
        uri
    end

    # def create_new_future(data)
    #     data["daily"].each do |day|
    #         Freshies::Future.new(
    #             @name, #name
    #             day["dt"], #date
    #             day["temp"]["min"], #min
    #             day["temp"]["max"], #max
    #             day["weather"][0]["main"]#conditions
    #         )
    #     end
    # end
end