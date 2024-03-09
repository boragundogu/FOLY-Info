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
            Text("Round \(previousRoundVM.previousRound?.id ?? 0) has ended. Congrats to winners!")
                .onAppear {
                    previousRoundVM.fetchCurrentRoundData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        previousRoundVM.fetchPreviousRoundData(prevNum: 2)
                    }
                }
                .padding()
                .font(.system(size: 17, weight: .light, design: .default))
        }
        .padding()
    }
}

#Preview {
    SecondPreviousCardView()
}
