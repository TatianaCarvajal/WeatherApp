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
    var text = ""
    
    @Published var isLoading = false
    @Published var error: ServiceError?
    @Published var isShowingError = false
    @Published var weather: WeatherUI?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchCityWeather() async {
        isLoading = true
        do {
            let weatherData = try await service.fetchCityWeather(cityName: text)
            weather = cityWeatherFormatter.formatWeatherInformation(weatherData)
        }
        catch {
            if let error = error as? ServiceError {
                self.error = error
                isShowingError = true
            }
        }
        isLoading = false
    }
}


