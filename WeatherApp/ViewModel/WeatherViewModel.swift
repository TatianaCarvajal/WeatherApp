//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    private let service: ServiceProtocol
    private let cityWeatherFormatter = CityWeatherFormatter()
    
    @Published var isLoading = false
    @Published var error: Error?
    @Published var weather: WeatherUI?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchCityWeather() async {
        isLoading = true
        do {
            let weatherData = try await service.fetchCityWeather(cityName: "paris")
            weather = cityWeatherFormatter.formatWeatherInformation(weatherData)
        }
        catch {
            self.error = error
        }
        isLoading = false
    }
}


