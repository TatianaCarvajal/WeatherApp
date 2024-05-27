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
    case snow
    case drizzle
    case thunderstorm
    case mist
    case smoke
    case haze
    case dust
    case fog
    case sand
    case squall
    case tornado
    
    init?(rawValue: String) {
        switch rawValue {
        case "Clouds": self = .clouds
        case "Rain": self = .rain
        case "Clear": self = .clear
        case "Snow": self = .snow
        case "Thunderstorm": self = .thunderstorm
        case "Drizzle": self = .drizzle
        case "Mist": self = .mist
        case "Smoke": self = .smoke
        case "Haze": self = .haze
        case "Dust": self = .dust
        case "Fog": self = .fog
        case "Sand": self = .sand
        case "Squall": self = .squall
        case "Tornado": self = .tornado
        default: return nil
        }
    }
}
