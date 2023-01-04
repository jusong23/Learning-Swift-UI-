//
//  CurrentWeather.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import Foundation

// 데이터 모델 구현
// 최종적으로 보여질 것이 문자열이니까 숫자가 아니라 문자열로 그냥 두기
struct CurrentWeather {
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let surise: String
    let sunset: String
    let forecasetedData: Date // 위젯 표시할때의 데이터
}

// 프리뷰에서 사용할 데이터
extension CurrentWeather {
    static var preview: CurrentWeather {
        return CurrentWeather(icon: "sun.max.fill", weather: "맑음", temperature: Double.randomTemperatureString, maxTemperature: Double.randomTemperatureString, minTemperature: Double.randomTemperatureString, surise: "오전 6:00", sunset: "오후 6:00", forecasetedData: .now)
        // CurrentWeather형의 '타입 프로퍼티'를 선언하고 인스턴스를 고정값으로 채워서 리턴
    }
}
