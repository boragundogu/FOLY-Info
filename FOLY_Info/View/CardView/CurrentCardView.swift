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
        ZStack {
            Text(currentRoundVM.currentRound?.message ?? "Message")
                .padding()
                .font(.system(size: 20, weight: .medium, design: .default))
        }
        .padding()
        .onAppear {
            currentRoundVM.fetchCurrentRoundData()
        }
        
    }
}

#Preview {
    CurrentCardView()
}
