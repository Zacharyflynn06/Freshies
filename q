
[1mFrom:[0m /home/zacharyflynn06/Flatiron/projects/Freshies/lib/api.rb:21 Freshies::API#forecast_uri_for:

    [1;34m11[0m: [32mdef[0m [1;34mforecast_uri_for[0m(zipcode)
    [1;34m12[0m:     parameters = {
    [1;34m13[0m:         [35munits[0m: [31m[1;31m"[0m[31mimperial[1;31m"[0m[31m[0m,
    [1;34m14[0m:         [35mappid[0m: [31m[1;31m"[0m[31m#{ENV[[1;31m'[0m[31mAPI_KEY[1;31m'[0m[31m[0m[31m]}[0m[31m[1;31m"[0m[31m[0m,
    [1;34m15[0m:         [35mzip[0m: zipcode,
    [1;34m16[0m:     }
    [1;34m17[0m:     uri = URI([1;34;4mINITIAL_URL[0m)
    [1;34m18[0m:     uri.query = [1;34;4mURI[0m.encode_www_form(parameters)
    [1;34m19[0m:     uri
    [1;34m20[0m: 
 => [1;34m21[0m:     binding.pry
    [1;34m22[0m: [32mend[0m

