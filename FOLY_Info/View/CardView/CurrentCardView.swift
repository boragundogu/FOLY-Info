//
//  CurrentCard.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 28.02.2024.
//

import SwiftUI

struct CurrentCardView: View {
    
    @StateObject var currentRoundVM = CurrentRoundVM()
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: currentRoundVM.currentRound?.minimapUrl ?? "xx")) { image in
                image.image?.resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 350, height: 350, alignment: .center)
        .onAppear{
            currentRoundVM.fetchCurrentRoundData()
        }
    }
}

#Preview {
    CurrentCardView()
}
