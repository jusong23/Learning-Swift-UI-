//
//  Double+Temperature.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import Foundation

// 이 파일안에서만 사용할 것
fileprivate let formatter: MeasurementFormatter = {
    let f = MeasurementFormatter()
    f.numberFormatter.maximumFractionDigits = 0
    f.unitOptions = .temperatureWithoutUnit
    return f
}()

extension Double {
    var temperatureString: String {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return formatter.string(from: temperature)
    }
    
    static var randomTemperatureString: String {
        return Double.random(in: -10...30).temperatureString
    }
} // Double 타입의 확장선
