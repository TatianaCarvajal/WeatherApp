//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Tatiana Carvajal on 28/05/24.
//
@testable import WeatherApp
import XCTest


final class WeatherViewModelTests: XCTestCase {

    @MainActor 
    func testFetchCityWeather_givenServiceSuccess() async {
        // Given
        let weatherViewModel = WeatherViewModel(service: ServiceProtocolMock())
        // When
        await weatherViewModel.fetchCityWeather()
        // Then
        XCTAssertEqual(weatherViewModel.weather?.name, "paris")
        XCTAssertFalse(weatherViewModel.isLoading)
        XCTAssertFalse(weatherViewModel.isShowingError)
        XCTAssertNil(weatherViewModel.error)
        XCTAssertTrue(weatherViewModel.text.isEmpty)
    }
    
    @MainActor
    func testFetchCityWeather_givenServiceFailure() async {
        // Given
        var serviceProtocolMock = ServiceProtocolMock()
        serviceProtocolMock.withSuccess = false
        let weatherViewModel = WeatherViewModel(service: serviceProtocolMock)
        // When
        await weatherViewModel.fetchCityWeather()
        // Then
        XCTAssertNil(weatherViewModel.weather)
        XCTAssertEqual(weatherViewModel.error, ServiceError.noDataFound)
        XCTAssertFalse(weatherViewModel.isLoading)
        XCTAssertTrue(weatherViewModel.isShowingError)
        XCTAssertTrue(weatherViewModel.text.isEmpty)
    }
}



