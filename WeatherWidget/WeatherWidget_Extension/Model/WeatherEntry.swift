//
//  WeatherEntry.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/05.
//

import Foundation
import WidgetKit

// 위젯에 표시하는 개별 데이터 전용 프로토콜
struct WeatherEntry: TimelineEntry {
    let widgetData: WidgetData
    
    var date: Date{
        widgetData.date
    }
}
