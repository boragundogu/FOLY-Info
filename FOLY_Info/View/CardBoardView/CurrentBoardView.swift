//
//  CurrentCardView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct CurrentBoardView: View {
    
    @ObservedObject var currentRoundVM = CurrentRoundVM()
    
    var body: some View {
        VStack {
            
            Text("Current Round")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .padding(.top, 15)
            
            if let round = currentRoundVM.currentRound {
                
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
            currentRoundVM.fetchCurrentRoundData()
        }
    }
}

#Preview {
    CurrentBoardView()
}
