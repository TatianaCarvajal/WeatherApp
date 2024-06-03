//
//  ServiceError.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 24/04/24.
//

import Foundation

enum ServiceError: LocalizedError {
    case urlDoesNotExist
    case noDataFound
    
    var errorDescription: String? {
        switch self {
        case .urlDoesNotExist:
            return "Url doesn't exist"
        case .noDataFound:
            return "No data found"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .urlDoesNotExist:
            "We couldn't find the url"
        case .noDataFound:
            "We couldn't find information of the city, please try again"
        }
    }
}
