//
//  ActivePlayerView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 5.03.2024.
//

import SwiftUI
import Combine

struct PlayerData: Decodable {
    let sockets : Sockets
}

struct Sockets: Decodable {
    let connections: Int
    let authenticatedPlayers: Int
}

class PlayerDataManager: ObservableObject {
    @Published var playerData: PlayerData?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://gameserver.heliosblockchain.io/stats") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(PlayerData.self, from: data)
                DispatchQueue.main.async {
                    self.playerData = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct ActivePlayerView: View {
    
    @ObservedObject var playerDataManager = PlayerDataManager()
    
    var body: some View {
        VStack {
            if let playerData = playerDataManager.playerData {
                Text("Active Player: \(playerData.sockets.connections)")
                    .fontWeight(.bold)
            } else {
                Text("Loading...")
            }
        }
        .onAppear{
            playerDataManager.fetchData()
        }
    }
}

#Preview {
    ActivePlayerView()
}
