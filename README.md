# Freshies

## Welcome to *Freshies* 

Freshies is a user friendly CLI application used to check the conditions at your favorite Colorado Ski Areas. This app uses geographical coordinates to specifically target the specific Ski Area base, and returns weather data as it would pertain to a ski/snowboard enthusiast. 

#### *"Freshies"* in ski culture, refers to the coveted fresh snow sought by ski and snowboard enthusiast.

## Usage

This app allows the User to quickly compare conditions at ten of the countries leading ski resorts:

- Aspen
- Beaver Creak
- Breckenridge
- Copper
- Crested Butte 
- Keystone
- Steamboat
- Telluride
- Vail
- Winter Park

When prompted, the user interface gives the user simple instructions to select the ski-resort they wish to see the current conditions at.  The user is also given a choice to see the 7-day forecast, and check another city.
__________________________________________________________________________________________

## Installation

Run bundle install in your terminal to install all required gems.

## Authorization

The user will need a FREE API key to use *Freshies*, which can be found by navigating [here](https://openweathermap.org/price). 

The user will select Get API Key under the Free heading.  Then you will be prompted to set up an account and given an API key. 

Once you have your API key, create a .env file by typing `mkdir .env` in your terminal.

Then, add your API key to the .env file as demonstrated: API_KEY= "your key here"

## Initialization

Run bin/freshies in your terminal to begin the program.

## Commands

Freshies uses the arrow keys and the enter key to browse and select choices.

The yes/no questions can be answered as `y/n` or spelled out as `yes/no`.

## Instructions

After the user installs and initializes the program as described above, they will be welcomed, and the data will be loaded. 

Once loading is complete, the user will be prompted: 

`Do you want to find the freshies?`

If `no`, the user will be presented with the goodbye message and exit the program.

If `yes` the user will be prompted:

`Scroll down and select a Ski-Area to check its conditions!`

The user selects which Ski-Area they want to check and is presented with the current conditions at the base of the specified Ski Area.

The user is now prompted:

`Would you like to see a 7-day forecast for #{city_input}?`

If `yes`, the user will be presented with the 7-day forecast for the Ski Area and then be returned to the menu. 

If `no` the user is returned to the menu.

To exit, simply answer `no` when prompted:

`Do you want to check another city?`

At this point, the user is presented a goodbye message, and the terminal clears.

Thanks for using *Freshies*

## License

MIT License

Copyright (c) 2020 Zacharyflynn06

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


    
