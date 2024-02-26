//
//  ContentView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currentRoundVM = CurrentRoundVM()
    
    var body: some View {
        VStack {
            if let round = currentRoundVM.previousRound {
                Text(round.message)
                ForEach(0..<min(round.prizes.count, round.leaderboard.count), id: \.self) { index in
                    let leaderboardItem = round.leaderboard[index]
                    let prizeItem = round.prizes[index]
                    
                    HStack {
                        Text(leaderboardItem.rank)
                        Spacer()
                        Text(String(leaderboardItem.score).suffix(9))
                        Spacer()
                        Text(leaderboardItem.characterName)
                        Spacer()
                        Text("\(prizeItem.amount) \(prizeItem.ticker)")
                    }
                    .padding()
                }
            }
        }
        .onAppear{
            currentRoundVM.fetchCurrentRoundData()
            currentRoundVM.fetchPreviousRoundData(prevNum: 2)
        }
    }
}
#Preview {
    ContentView()
}
