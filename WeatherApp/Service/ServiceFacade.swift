//
//  ServiceFacade.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

struct ServiceFacade: ServiceProtocol {
    private let key = "695a5f5698803faf92068d675e0be03c"
    
    func fetchCityWeather(cityName: String) async throws -> CityWeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather")
        else {
            throw ServiceError.urlDoesNotExist
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: key)
        ]
        guard let requestUrl = components?.url else {
            throw ServiceError.urlDoesNotExist
        }
        let (data, _) = try await URLSession.shared.data(from: requestUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(CityWeatherData.self, from: data)
        return result
    }
}
