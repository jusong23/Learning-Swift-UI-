//
//  Forecast.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    
    let date: String
    let time: String
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let surise: String
    let forecastedDate: Date
    
}
// List에 바인딩 할 것임
// 마찬가지로 모두 문자열로해서 최종적으로 저장1

extension Forecast {
    static var preview: [Forecast] {
        return (0..<10).map {
            let dt = Date.now.addingTimeInterval(TimeInterval($0 * 3600 * 24))
            
            return Forecast(date: dt.formatted(.dateTime.month().day()), time: dt.formatted(.dateTime.month().minute()), icon: "sun.max.fill", weather: "맑음", temperature: Double.randomTemperatureString, maxTemperature: Double.randomTemperatureString, minTemperature: Double.randomTemperatureString, surise: Double.randomTemperatureString, forecastedDate: .now)
        }
    }
    // 배열형의 '타입 프로퍼티'를 선언하고 인스턴스를 고정값으로 채워서 리턴
}
