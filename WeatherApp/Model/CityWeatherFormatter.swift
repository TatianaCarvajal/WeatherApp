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
}

struct CityWeatherFormatter {
    
    func formatWeatherInformation(_ weather: CityWeatherData) -> WeatherUI {
        let temperatureAsInteger = Int(weather.main.temp)
        
        var weatherType: WeatherType = .clouds
        var weatherDescription: String = ""
        if let weather = weather.weather.first {
            weatherType = WeatherType(rawValue: weather.main) ?? .clouds
            weatherDescription = weather.description
        }
       
        var weatherUI = WeatherUI(
            temperature: "\(temperatureAsInteger)º",
            weatherType: weatherType,
            weatherDescription: weatherDescription,
            name:  weather.name,
            longitude: "Lon: \(weather.coord.lon)",
            latitude: "Lat: \(weather.coord.lat)"
        )
        return weatherUI
    }
}
