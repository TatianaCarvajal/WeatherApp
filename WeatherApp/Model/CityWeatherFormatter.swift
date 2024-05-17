//
//  CityWeatherFormatter.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import Foundation

struct WeatherUI {
    var temperature: String
    var weatherType: WeatherType
    var weatherDescription: String
    var name: String
    var longitude: String
    var latitude: String
    var minTemperature: String
    var maxTemperature: String
    var humidity: String
    var pressure: String
}

struct CityWeatherFormatter {
    
    func formatWeatherInformation(_ weather: CityWeatherData) -> WeatherUI {
        let temperatureAsInteger = Int(weather.main.temp)
        let minTemperatureAsInteger =  Int(weather.main.tempMin)
        let maxTemperatureAsInteger =  Int(weather.main.tempMax)
        let humidityAsInteger =  Int(weather.main.humidity)
        
        var weatherType: WeatherType = .clouds
        var weatherDescription: String = ""
        if let weather = weather.weather.first {
            weatherType = WeatherType(rawValue: weather.main) ?? .clouds
            weatherDescription = weather.description
        }
        
        let weatherUI = WeatherUI(
            temperature: "\(temperatureAsInteger)º",
            weatherType: weatherType,
            weatherDescription: weatherDescription,
            name:  weather.name,
            longitude: "Lon: \(weather.coord.lon)",
            latitude: "Lat: \(weather.coord.lat)",
            minTemperature: "\(minTemperatureAsInteger)º",
            maxTemperature: "\(maxTemperatureAsInteger)º",
            humidity: "\(humidityAsInteger)%",
            pressure: "\(weather.main.pressure) hPa"
        )
        return weatherUI
    }
}
