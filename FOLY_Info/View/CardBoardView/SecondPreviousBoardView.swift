//
//  SecondPreviousCardView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct SecondPreviousView: View {
    
    @StateObject var previousRoundVM = CurrentRoundVM()
    
    var body: some View {
        VStack {
            if let round = previousRoundVM.previousRound {
                
                ForEach(0..<min(round.prizes.count, round.leaderboard.count), id: \.self) { index in
                    let leaderboardItem = round.leaderboard[index]
                    let prizeItem = round.prizes[index]
                    
                    HStack {
                        Text(leaderboardItem.rank)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(.leading, 5)
                        Spacer()
                        Text(String(leaderboardItem.score).suffix(9))
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 5)
                        Spacer()
                        Text(leaderboardItem.characterName)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(.leading, 5)
                        Spacer()
                        Text("\(prizeItem.amount) \(prizeItem.ticker)")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(.trailing, 5)
                    }
                    .padding()
                }
            }
        }
        .onAppear{
            previousRoundVM.fetchPreviousRoundData(prevNum: 2)
        }
    }
}

#Preview {
    SecondPreviousView()
}
