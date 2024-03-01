//
//  SecondPreviousCardView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 29.02.2024.
//

import SwiftUI

struct SecondPreviousCardView: View {
    
    @StateObject var previousRoundVM = CurrentRoundVM()
    
    var body: some View {
        ZStack {
            Text(previousRoundVM.previousRound?.message ?? "")
                .padding()
                .font(.system(size: 20, weight: .medium, design: .default))
        }
        .padding()
        .onAppear {
            previousRoundVM.fetchCurrentRoundData()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                previousRoundVM.fetchPreviousRoundData(prevNum: 2)
            }
        }
    }
}

#Preview {
    SecondPreviousCardView()
}
