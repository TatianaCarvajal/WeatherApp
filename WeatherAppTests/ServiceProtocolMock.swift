//
//  ServiceProtocolMock.swift
//  WeatherAppTests
//
//  Created by Tatiana Carvajal on 28/05/24.
//

import Foundation
@testable import WeatherApp

class ServiceProtocolMock: ServiceProtocol {
    var withSuccess = true
    
    func fetchCityWeather(cityName: String) async throws -> CityWeatherData {
        if withSuccess == false {
            throw ServiceError.noDataFound
        } else {
            return CityWeatherData(
                coord: Coordinates(
                    lon: 22.4,
                    lat: 10.3
                ),
                weather: [],
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
    }
}
