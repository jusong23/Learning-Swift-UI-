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
            // 프레임 띄워보기 ! 사진 종횡비 안맞아서 세로가 짤림
            GeometryReader { reader in
                Image("bg")
                    .resizable()
                    .scaledToFill() // 사용가능한 공간 채우고 종횡비 유지(GeometryReader)
                    .ignoresSafeArea()
                    .overlay {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                }} // GeometryReader으로 종횡비 맞추기 성공
                
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
                            Color.yellow
                                .frame(height: 200)
                        }
                        .frame(height: reader.size.height)
                        // VStack의 높이를 GeometryReader와 동일하게 고정
                        
                        Spacer(minLength: reader.safeAreaInsets.bottom)
                        // SafeArea 밑의 크기 만큼 여백을 줌(평소에 안보임)
                        
                        Color.green
                            .frame(height: 1000)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
