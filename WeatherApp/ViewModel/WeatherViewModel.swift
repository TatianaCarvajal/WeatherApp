//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private let service: ServiceProtocol
    @Published var isLoading = false
    @Published var error: Error?
    @Published var weatherData: CityWeatherData?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchCityWeather() async {
        isLoading = true
        do {
            weatherData = try await service.fetchCityWeather(cityName: "medellin")
        }
        catch {
            self.error = error
        }
        isLoading = false
    }
}
