//
//  PreviousCardView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 29.02.2024.
//

import SwiftUI

struct PreviousCardView: View {
    
    @StateObject var previousRoundVM = CurrentRoundVM()
    
    var body: some View {
        ZStack {
            Text((previousRoundVM.previousRound?.summary.prefix(40) ?? "") + (previousRoundVM.previousRound?.summary.suffix(1) ?? ""))
                .onAppear {
                    previousRoundVM.fetchCurrentRoundData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        previousRoundVM.fetchPreviousRoundData(prevNum: 1)
                    }
                }
                .padding()
                .font(.system(size: 17, weight: .light, design: .default))
        }
        .padding()
    }
}

#Preview {
    PreviousCardView()
}
