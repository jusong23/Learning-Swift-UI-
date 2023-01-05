//
//  CurrentWeatherView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct CurrentWeatherView: View {
    let model: CurrentWeather?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let model = model {
                HStack {
                    Image(systemName: model.icon)
                    Text(model.weather)
                }
                .font(.largeTitle) // fontSize
                
                HStack(spacing: 20) {
                    Label(model.maxTemperature, systemImage: "arrow.up")
                    Label(model.minTemperature, systemImage: "arrow.down")
                }
                
                
                HStack(alignment: .lastTextBaseline){
                    Text(model.temperature)
                        .font(.system(size: 120))
                        .fontWeight(.ultraLight)
                    .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor) // 아이폰과 똑같은 컬러 및 모양
                        Text(model.sunrise)
                        
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor) // 아이폰과 똑같은 컬러 및 모양
                        Text(model.sunset)
                    }.font(.caption)
                }
                // 텍스트가 뷰의 가능공간 안에 축소될 수 있는 최소치를 지정해준다.
            }
        }
        .padding(.horizontal) // 수평방향의 패딩을 달아줘 !
        .foregroundColor(.white) // tintColor
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(model: .preview)
    }
}
