//
//  WeatherService.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation
import CoreLocation

// 이 클래스에서 Delegate 구현 , 이 클래스를 View에서 감시할 수 있도록
class WeatherService: NSObject, ObservableObject {
    let locationManager: CLLocationManager
    
    // 뷰에서 감시할 수 있는 속성
    @Published var currentLocation: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecastList: [Forecast]?
    
    @Published var lastError: String?
    
    let isPreviewService: Bool
    
    init(preview: Bool = false) {
        isPreviewService = preview
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        locationManager.delegate = self
    }
    
    static var preview: WeatherService {
        let service = WeatherService(preview: true)
        service.currentLocation = "강남역"
        service.currentWeather = CurrentWeather.preview
        service.forecastList = Forecast.preview
    }
}
// NSObject
// ObservableObject?
// @Published

