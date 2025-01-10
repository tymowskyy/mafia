//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import Foundation
import Combine

class GameOptionsViewModel: ObservableObject {
    @Published var factions: [Faction] = []
    @Published var playerNames: [PlayerName] = []
    var repository: GameOptionsRepository


    init(repository: GameOptionsRepository) {
        self.repository = repository
        repository.$factions
            .receive(on: DispatchQueue.main)
            .assign(to: &$factions)
        repository.$playerNames
            .receive(on: DispatchQueue.main)
            .assign(to: &$playerNames)
    }
    
    func numberOfPlayers() -> Int {
        return playerNames.count
    }
    
    func numberOfRoles() -> Int {
        return factions.reduce(0, { $0 + $1.size })
    }
    
    func canStartGame() -> Bool {
        return numberOfRoles() == numberOfPlayers() && numberOfPlayers()>0
    }
}
