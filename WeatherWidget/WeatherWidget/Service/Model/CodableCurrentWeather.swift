//
//  CodableCurrentWeather.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation

// MARK: - CodableCurrentWeather
struct CodableCurrentWeather: Codable {
    let dt: Double
    let main: Main
    let sys: Sys
    let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let sunrise, sunset: Double
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

