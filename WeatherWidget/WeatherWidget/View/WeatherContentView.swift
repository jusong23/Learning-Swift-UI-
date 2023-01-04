//
//  WeatherContentView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct WeatherContentView: View {
    var body: some View {
        VStack{
            Text("강남역")
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            // 정확한 크기계산 시
            GeometryReader{ reader in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.red
                        CurrentWeatherView()
                    }
                    .frame(height: reader.size.height)
                    // VStack의 높이를 GeometryReader와 동일하게 고정
                    
                    Spacer(minLength: reader.safeAreaInsets.bottom)
                    // SafeArea 밑의 크기 만큼 여백을 줌(평소에 안보임)
                    
                    ForecastView()
                }
            }
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView()
            .preferredColorScheme(.dark)
    }
}
