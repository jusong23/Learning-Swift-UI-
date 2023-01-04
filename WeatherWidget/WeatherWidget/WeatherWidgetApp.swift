//
//  WeatherWidgetApp.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

@main
struct WeatherWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
