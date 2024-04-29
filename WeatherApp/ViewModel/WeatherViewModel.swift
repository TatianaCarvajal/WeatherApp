//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private let service: ServiceProtocol
    @Published var isLoading = true
    @Published var error: Error?
    @Published var weatherData: [Weather] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
}
