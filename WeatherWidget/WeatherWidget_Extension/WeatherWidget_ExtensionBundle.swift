//
//  WeatherWidget_ExtensionBundle.swift
//  WeatherWidget_Extension
//
//  Created by mobile on 2023/01/05.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidget_ExtensionBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget_Extension()
        WeatherWidget_ExtensionLiveActivity()
    }
}
