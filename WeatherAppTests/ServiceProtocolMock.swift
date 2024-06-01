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
            return .mock
        }
    }
}
