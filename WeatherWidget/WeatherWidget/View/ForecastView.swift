//
//  ForecastView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        // Forecast.preview에 있는 것들에 대한 템플릿화
        ForEach(Forecast.preview) { forecast in
            HStack {
                VStack(alignment: .leading) {
                    Text(forecast.date)
                    Text(forecast.time)
                }
                .font(.caption)
                
                Spacer()
                
                Image(systemName: forecast.icon)
                    .font(.title3)
                
                Text(forecast.weather)
                    .font(.title3)
                
                Spacer()
                
                Text(forecast.temperature)
                    .font(.system(size:40))
                    .fontWeight(.ultraLight)
                    .frame(minWidth: 70, alignment: .trailing) // 너비 고정
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        // Foreach로 템플릿화를 시켜줬기 때문에 ForecastView()가 그 개수만큼 늘어남!
        // 작동엔 지장 없지만 preview가 늘어난다
        VStack {
            ForecastView()
                .preferredColorScheme(.dark)
        }
    }
}
