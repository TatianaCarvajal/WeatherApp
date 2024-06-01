//
//  CityWeatherFormatterTests.swift
//  WeatherAppTests
//
//  Created by Tatiana Carvajal on 29/05/24.
//

import XCTest
@testable import WeatherApp

final class CityWeatherFormatterTests: XCTestCase {

    func testFormatWeatherInformation() {
        // Given
        let formatWeather = CityWeatherFormatter()
        // When
        let formatWeatherInformation = formatWeather.formatWeatherInformation(.mock)
        // Then
        XCTAssertEqual(formatWeatherInformation.temperature, "20º")
        XCTAssertEqual(formatWeatherInformation.weatherType, .rain)
        XCTAssertEqual(formatWeatherInformation.weatherDescription, "rain")
        XCTAssertEqual(formatWeatherInformation.name, "paris")
        XCTAssertEqual(formatWeatherInformation.longitude, "Lon: 22.4")
        XCTAssertEqual(formatWeatherInformation.latitude, "Lat: 10.3")
        XCTAssertEqual(formatWeatherInformation.minTemperature, "16º")
        XCTAssertEqual(formatWeatherInformation.maxTemperature, "22º")
        XCTAssertEqual(formatWeatherInformation.humidity, "30%")
        XCTAssertEqual(formatWeatherInformation.pressure, "10.3 hPa")
    }
}
