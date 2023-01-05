//
//  WeatherService+Api.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation
import CoreLocation

extension WeatherService {
    func fetchWeather(location: CLLocation) async {
        do {
            let fetchedCurrentWeather = try await fetch(location: location)
            currentWeather = CurrentWeather(data: fetchedCurrentWeather)
            print(currentWeather)
        } catch {
            lastError = "Api 요청 실패"
        }
    }
    
    private func fetch(location: CLLocation) async throws -> CodableCurrentWeather {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        
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
        let result = try decoder.decode(CodableCurrentWeather.self, from: data)
        
        return result
    }
}
