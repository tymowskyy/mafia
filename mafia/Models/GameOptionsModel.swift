//
//  GameOptionsModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import Foundation

struct GameOptionsModel {
    var playerNames: [PlayerName] = []
    var factions: [Faction] = []
}

#if DEBUG
extension GameOptionsModel {
    static func exampleIncomplete() -> GameOptionsModel {
        return GameOptionsModel(
            playerNames: [PlayerName(name: "John"), PlayerName(name: "Smith")],
            factions: [Faction(name: "villagers", size: 2), Faction(name: "mafia", size: 1)]
        )
    }
    
    static func exampleReadyToStart() -> GameOptionsModel {
        return GameOptionsModel(
            playerNames: ["A", "B", "C", "D", "E"].map{ PlayerName(name: $0) },
            factions: [Faction(name: "X", size: 4), Faction(name: "Y", size: 1)]
        )
    }
}

#endif
