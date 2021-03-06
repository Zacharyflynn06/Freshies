class Freshies::API

    INITIAL = "http://api.openweathermap.org/data/2.5/onecall?"

    LOCATIONS = {:Breckenridge => [39.4803, -106.0667],
                 :Telluride => [37.9363, -107.8466],
                 :Keystone => [39.6084, -105.9437],
                 :Crested_Butte => [38.8697, -106.9878],
                 :Vail => [39.6403, -106.3742],
                 :Aspen => [39.1911, -106.8175],
                 :Steamboat => [40.4572, -106.8045],
                 :Copper => [39.5022, -106.1497],
                 :Winter_Park => [39.8917, -105.7631],
                 :Beaver_Creek => [39.6042, -106.5165]}
 
    def initialize
        LOCATIONS.each do |k, v|
            api_call_for(k, v[0], v[1])
        end
    end

    def api_call_for(city, lat, lon)
        uri = uri_for(lat, lon)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        Freshies::Current.new(city, data["current"])
        Freshies::Forecast.new(city, data["daily"])
    end

    def uri_for(lat, lon)
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

end