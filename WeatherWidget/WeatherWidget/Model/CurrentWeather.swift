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
    let sunrise: String
    let sunset: String
    let forecasetedData: Date // 위젯 표시할때의 데이터
}

// 프리뷰에서 사용할 데이터
extension CurrentWeather {
    static var preview: CurrentWeather {
        return CurrentWeather(icon: "sun.max.fill", weather: "맑음", temperature: Double.randomTemperatureString, maxTemperature: Double.randomTemperatureString, minTemperature: Double.randomTemperatureString, sunrise: "오전 6:00", sunset: "오후 6:00", forecasetedData: .now)
        // CurrentWeather형의 '타입 프로퍼티'를 선언하고 인스턴스를 고정값으로 채워서 리턴
    }
    
    // CurrentWeather 라는 data 모델(struct)을 익스텐션으로 따와서 초기화 하는 것 !
    // 그렇기에, 위에 있는 변수를 하나하나 초기화 하지 않으면 에러남
    init?(data: CodableCurrentWeather) {
        guard let weatherInfo = data.weather.first else { return nil }
        
        icon = weatherInfo.icon.weatherImageName
        weather = weatherInfo.weatherDescription
        temperature = data.main.temp.temperatureString
        maxTemperature = data.main.tempMax.temperatureString
        minTemperature = data.main.tempMin.temperatureString
        
        var date = Date(timeIntervalSince1970: data.sys.sunrise) // 유닉스 시간 변경
        sunrise = date.formatted(.dateTime.hour().minute())
        
        date = Date(timeIntervalSince1970: data.sys.sunset) // 유닉스 시간 변경
        sunset = date.formatted(.dateTime.hour().minute())
        
        forecasetedData = Date(timeIntervalSince1970: data.dt)
    }
}
