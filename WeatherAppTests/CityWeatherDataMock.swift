//
//  CityWeatherDataMock.swift
//  WeatherAppTests
//
//  Created by Tatiana Carvajal on 29/05/24.
//

import Foundation
@testable import WeatherApp

extension CityWeatherData {
    static var mock = CityWeatherData(
        coord: Coordinates(
            lon: 22.4,
            lat: 10.3
        ),
        weather: [Weather(
            main: "Rain",
            description: "rain"
        )],
        main: Main(
            temp: 20,
            tempMin: 16,
            tempMax: 22,
            pressure: 10.30,
            humidity: 30
        ),
        name: "paris"
    )
}
