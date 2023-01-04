//
//  MainView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            WeatherContentView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
