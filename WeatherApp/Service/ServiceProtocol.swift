//
//  ServiceProtocol.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

protocol ServiceProtocol {
    func fetchCityWeather(cityName: String) async throws -> CityWeatherData
}
