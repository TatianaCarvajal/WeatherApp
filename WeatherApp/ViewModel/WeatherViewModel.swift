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
    
    @Published var text = ""
    @Published var isLoading = false
    @Published var error: ServiceError?
    @Published var isShowingError = false
    @Published var weather: WeatherUI?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchCityWeather() async {
        guard !text.isEmpty else { return }
        isLoading = true
        do {
            let weatherData = try await service.fetchCityWeather(cityName: text)
            weather = cityWeatherFormatter.formatWeatherInformation(weatherData)
        }
        catch is ServiceError {
            self.error = error
            isShowingError = true
        }
        catch {
            self.error = .noDataFound
            isShowingError = true
        }
        isLoading = false
    }
}


