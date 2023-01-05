//
//  WeatherWidgetApp.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

@main
struct WeatherWidgetApp: App { 
    let service = WeatherService()
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(service) // ???
        }
    }
}

