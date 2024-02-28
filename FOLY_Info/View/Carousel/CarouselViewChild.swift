//
//  CarouselViewChild.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct CarouselViewChild: View, Identifiable {
    var id: Int
    @ObservedObject var currentRoundVM = CurrentRoundVM()
    
    
    @ViewBuilder var content: any View
    
    var body: some View {
        ZStack{
            AnyView(content)
        }
    }
}
