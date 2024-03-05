//
//  PreviousCardView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct PreviousBoardView: View {
    
    @StateObject var previousRoundVM = CurrentRoundVM()
    
    var body: some View {
        VStack {
            
            
            
            if let round = previousRoundVM.previousRound {
                
                Text("Previous Round" + "(\(previousRoundVM.previousRound?.id ?? 83))")
                    .onAppear {
                        previousRoundVM.fetchCurrentRoundData()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            previousRoundVM.fetchPreviousRoundData(prevNum: 1)
                        }
                    }
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding(.top, 15)
                
                    ForEach(0..<min(round.prizes.count, round.leaderboard.count), id: \.self) { index in
                        let leaderboardItem = round.leaderboard[index]
                        let prizeItem = round.prizes[index]
                        
                        HStack {
                            Spacer()
                            Text(leaderboardItem.rank)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .frame(width: 40, alignment: .center)
                            Text(String(leaderboardItem.score).suffix(9))
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .multilineTextAlignment(.trailing)
                                .frame(width: 80, alignment: .center)
                            Text(leaderboardItem.characterName)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .frame(width: 80, alignment: .center)
                            Spacer()
                            Text("\(prizeItem.amount) \(prizeItem.ticker)")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .frame(width: 70, alignment: .center)
                        }
                        .padding()
                        .padding(.trailing, 30)
                    }
            }
        }
        .onAppear {
            previousRoundVM.fetchCurrentRoundData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                previousRoundVM.fetchPreviousRoundData(prevNum: 1)
            }
        }
    }
}

#Preview {
    PreviousBoardView()
}
