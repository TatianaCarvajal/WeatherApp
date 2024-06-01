//
//  CityWeather.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

struct Coordinates: Codable {
    var lon: Double
    var lat: Double
}

struct Weather: Codable {
    var main: String
    var description: String
}

struct Main: Codable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Double
    var humidity: Double
}

struct CityWeatherData: Codable {
    let coord: Coordinates
    var weather: [Weather]
    var main: Main
    var name: String
}
