//
//  WeatherService+Api.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation
import CoreLocation

extension WeatherService {
    enum ApiType: String {
        case forecast
        case weather
    }
    @MainActor
    func fetchWeather(location: CLLocation) async {
        do {
            async let fetchedCurrentWeather: CodableCurrentWeather = fetch(type: .weather, location: location)
            currentWeather = CurrentWeather(data: try await fetchedCurrentWeather)
            
            async let fetchedForecast: CodableForecast = try await fetch(type: .forecast, location: location)
            forecastList = try await fetchedForecast.list.compactMap {
                Forecast(data: $0)
            }
        } catch {
            lastError = "Api 요청 실패"
        }
    }
    
    private func fetch<ParsingType: Codable>(type: ApiType, location: CLLocation) async throws -> ParsingType {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather\(type.rawValue)")
        
        // url 뒤에 파라미터 추가
        components?.queryItems = [
            URLQueryItem(name: "appid", value: Self.apiKey), // extension의 Self
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "kr"),
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "appid", value: "\(location.coordinate.longitude)")
        ]
        
        guard let url = components?.url else {
            throw ApiError.invalidUrl(components?.host ?? "")
        }
        
        let (data, response) = try await  URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invaildResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.failed(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(ParsingType.self, from: data)
        
        return result
    }
}
