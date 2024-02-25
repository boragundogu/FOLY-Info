//
//  CurrentRoundVM.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 24.02.2024.
//

import Foundation


class CurrentRoundVM: ObservableObject {
    
    @Published var round: CurrentRound?
    @Published var previousRound: CurrentRound?
    
    func fetchCurrentRoundData(){
        
        guard let url = URL(string: "https://gameserver.heliosblockchain.io/round/current") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            guard let data = data else {
                return
            }
            
            do {
                let round = try JSONDecoder().decode(CurrentRound.self, from: data)
                DispatchQueue.main.async {
                    self.round = round
                }
            }
            catch {
                print("decode error for current round fetching" + "\(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func fetchPreviousRoundData(prevNum: Int){
        guard let url = URL(string: "https://gameserver.heliosblockchain.io/rounds/\((round?.id ?? 83) - prevNum)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else {
                return
            }
            
            do {
                let previousRound = try JSONDecoder().decode(CurrentRound.self, from: data)
                DispatchQueue.main.async {
                    self.previousRound = previousRound
                    print(url)
                }
            }
            catch {
                print("decode error for previous round fetching" + "\(error.localizedDescription)")
            }
        }.resume()
    }
}
