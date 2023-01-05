//
//  WeatherService.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation
import CoreLocation

// 이 클래스에서 Delegate 구현 , 이 클래스를 View에서 감시할 수 있도록 NSObject, ObservableObject 상속
class WeatherService: NSObject, ObservableObject {
    static let apiKey = "8296bc6a100ad05993547c61c2abb37f"
    
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
        
        return service
    }
    
    func fetch() {
        guard !isPreviewService else {return}
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
        default:
            lastError = "알 수 없는 오류가 발생했습니다."
        }
        
    } // API 요청 메소드
}

// NSObject
// ObservableObject?
// @Published
// @EnvironmentObject

