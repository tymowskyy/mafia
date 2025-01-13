//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import Foundation
import Combine

class GameOptionsViewModel: ObservableObject {
    @Published var gameOptions = GameOptions()
    var repository: GameOptionsRepository


    init(repository: GameOptionsRepository) {
        self.repository = repository
        repository.$gameOptions
            .receive(on: DispatchQueue.main)
            .assign(to: &$gameOptions)
    }
    
    func numberOfPlayers() -> Int {
        return gameOptions.playerNames.count
    }
    
    func numberOfRoles() -> Int {
        return gameOptions.factions.reduce(0, { $0 + $1.size })
    }
    
    func canStartGame() -> Bool {
        return numberOfRoles() == numberOfPlayers() && numberOfPlayers()>0
    }
}
