//
//  BackgroundView.swift
//  WeatherWidget
//
//  Created by mobile on 2023/01/04.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        // 프레임 띄워보기 ! 사진 종횡비 안맞아서 세로가 짤림
        GeometryReader { reader in
            Image("bg")
                .resizable()
                .scaledToFill() // 사용가능한 공간 채우고 종횡비 유지(GeometryReader)
                .ignoresSafeArea()
                .overlay {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
            }
        } // GeometryReader으로 종횡비 맞추기 성공
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
