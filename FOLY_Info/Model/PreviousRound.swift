//
//  CurrentRound.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 24.02.2024.
//

import Foundation


struct PreviousRound: Codable, Identifiable {
    
    let id: Int
    let timeLeft: Int
    let endDate: String
    let prizes: [Prizes]
    let minimapUrl: String
    let summary: String
    let leaderboard: [Leaderboard]
    
    
    struct Prizes: Codable {
        let rank: String
        let amount: String
        let ticker: String
    }
    
    struct Leaderboard: Codable {
        let characterName: String
        let score: String
        let rank: String
    }
}
