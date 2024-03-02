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

        VStack {
            Text(currentRoundVM.currentRound?.message ?? "message for current round.")
                .font(.system(size: 20, weight: .medium, design: .default))
        }
        .onAppear{
            currentRoundVM.fetchCurrentRoundData()
        }
        .padding()
    }
}

#Preview {
    CurrentCardView()
}
