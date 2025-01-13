//
//  GameOptionsRepository.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import Foundation

class GameOptionsRepository: ObservableObject {
    @Published private(set) var gameOptions: GameOptions
    
    init(gameOptions: GameOptions = GameOptions()) {
        self.gameOptions = gameOptions
    }
    
    func addFaction(faction: Faction) {
        gameOptions.factions.append(faction)
    }
    
    func removeFaction(at: Int) {
        gameOptions.factions.remove(at: at)
    }
    
    func changeFactionSize(at: Int, newSize: Int) {
        gameOptions.factions[at].size = newSize
    }
    
    func addPlayer(player: PlayerName) {
        gameOptions.playerNames.append(player)
    }
    
    func removePlayer(at: Int) {
        gameOptions.playerNames.remove(at: at)
    }
    
    func movePlayer(from: Int, to: Int) {
        gameOptions.playerNames.move(fromOffsets: IndexSet(integer: from), toOffset: to)
    }
}
