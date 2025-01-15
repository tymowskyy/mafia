//
//  GameState.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//

import Foundation

struct GameState: Codable, Identifiable, Hashable {
    var id = UUID()
    var factions: [Faction]
    var players: [Player]
    var date: Date = Date.now
}

extension GameState {
    func toGameOptions() -> GameOptions {
        return GameOptions(
            playerNames: players.map({ PlayerName(name: $0.name ) }),
            factions: factions
        )
    }
}
