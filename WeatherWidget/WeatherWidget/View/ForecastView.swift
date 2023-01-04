//
//  ForecastView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
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
        VStack { // 여기서 VStack 왜 ??
            ForecastView()
        }
            .preferredColorScheme(.dark)
    }
}
