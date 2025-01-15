//
//  GameOptions.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import Foundation

struct GameOptions: Codable {
    var playerNames: [PlayerName] = []
    var factions: [Faction] = []
}

extension GameOptions {
    func toGameState() -> GameState {
        return GameState(factions: factions, players: playerNames.map({ Player(id: $0.id, name: $0.name) }))
    }
}

#if DEBUG
extension GameOptions {
    static func exampleIncomplete() -> GameOptions {
        return GameOptions(
            playerNames: [PlayerName(name: "John"), PlayerName(name: "Smith")],
            factions: [Faction(name: "villagers", size: 2), Faction(name: "mafia", size: 1)]
        )
    }
    
    static func exampleReadyToStart() -> GameOptions {
        return GameOptions(
            playerNames: ["A", "B", "C", "D", "E"].map{ PlayerName(name: $0) },
            factions: [Faction(name: "X", size: 4), Faction(name: "Y", size: 1)]
        )
    }
}

#endif
