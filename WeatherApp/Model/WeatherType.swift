//
//  WeatherType.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 13/05/24.
//

import Foundation

enum WeatherType: String {
    case clouds
    case rain
    case clear
    
    init?(rawValue: String) {
        switch rawValue {
        case "Clouds": self = .clouds
        case "Rain": self = .rain
        case "Clear": self = .clear
        default: return nil
        }
    }
}
