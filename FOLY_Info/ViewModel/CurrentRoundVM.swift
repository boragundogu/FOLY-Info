//
//  CurrentRoundVM.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 24.02.2024.
//

import Foundation


class CurrentRoundVM: ObservableObject {
    
    @Published var currentRound: CurrentRound?
    @Published var previousRound: PreviousRound?
    
    func fetchCurrentRoundData(){
        
        guard let url = URL(string: "https://gameserver.heliosblockchain.io/round/current") else {
            return print("url error.")
        }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            guard let data = data else {
                return print("data error \(error?.localizedDescription ?? "!")")
            }
            
            do {
                let round = try JSONDecoder().decode(CurrentRound.self, from: data)
                DispatchQueue.main.async {
                    self.currentRound = round
                }
            }
            catch {
                print("decode error for current round fetching" + "\(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func fetchPreviousRoundData(prevNum: Int){
        
        let prevNum = prevNum
        
        guard let url = URL(string: "https://gameserver.heliosblockchain.io/rounds/\((currentRound?.id ?? 83) - prevNum)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else {
                return
            }
            
            do {
                let previousRound = try JSONDecoder().decode(PreviousRound.self, from: data)
                DispatchQueue.main.async {
                    self.previousRound = previousRound
                }
            }
            catch {
                print("decode error for previous round fetching" + "\(error.localizedDescription)")
            }
        }.resume()
    }
}
