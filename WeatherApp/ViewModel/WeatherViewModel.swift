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
    @Published var isLoading = false
    @Published var error: Error?
    @Published var temperature: String?
    @Published var weatherType: WeatherType?
    @Published var weatherDescription: String?
    @Published var name: String?
    @Published var lon: String?
    @Published var lat: String?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchCityWeather() async {
        isLoading = true
        do {
            let weatherData = try await service.fetchCityWeather(cityName: "paris")
            formatWeatherInformation(weatherData)
            
        }
        catch {
            self.error = error
        }
        isLoading = false
    }
    
    func formatWeatherInformation(_ weather: CityWeatherData) {
        let temperatureAsInteger = Int(weather.main.temp)
        self.temperature = "\(temperatureAsInteger)º"
        
        if let weather = weather.weather.first {
            weatherType = WeatherType(rawValue: weather.main) ?? .clouds
            weatherDescription = weather.description
        }
        
        name = weather.name
        
        lon = "Lon: \(weather.coord.lon)"
        lat = "Lat: \(weather.coord.lat)"
    }
}
