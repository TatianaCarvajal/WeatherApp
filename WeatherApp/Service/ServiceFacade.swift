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
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(self.key)")
        else {
            throw ServiceError.urlDoesNotExist
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(CityWeatherData.self, from: data)
        return result
    }
}
