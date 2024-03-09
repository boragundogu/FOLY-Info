//
//  SplashView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 10.03.2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var isSplashActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isSplashActive {
                CarouselView()
            } else {
                Color("appBG").ignoresSafeArea()
                VStack{
                    Image("appImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    isSplashActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
