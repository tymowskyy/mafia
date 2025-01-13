//
//  GameOptionsRepository.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import Foundation

class GameOptionsRepository: ObservableObject {
    @Published private(set) var playerNames: [PlayerName]
    @Published private(set) var factions: [Faction]
    
    init(playerNames: [PlayerName] = [], factions: [Faction] = []) {
        self.playerNames = playerNames
        self.factions = factions
    }
    
    func addFaction(faction: Faction) {
        factions.append(faction)
    }
    
    func removeFaction(at: Int) {
        factions.remove(at: at)
    }
    
    func changeFactionSize(at: Int, newSize: Int) {
        factions[at].size = newSize
    }
    
    func addPlayer(player: PlayerName) {
        playerNames.append(player)
    }
    
    func removePlayer(at: Int) {
        playerNames.remove(at: at)
    }
    
    func movePlayer(from: Int, to: Int) {
        playerNames.move(fromOffsets: IndexSet(integer: from), toOffset: to)
    }
    
    static func exampleIncomplete() -> GameOptionsRepository {
        return GameOptionsRepository(
            playerNames: [PlayerName(name: "John"), PlayerName(name: "Smith")],
            factions: [Faction(name: "villagers", size: 2), Faction(name: "mafia", size: 1)]
        )
    }
    
    static func exampleReadyToStart() -> GameOptionsRepository {
        return GameOptionsRepository(
            playerNames: [PlayerName(name: "A"), PlayerName(name: "B"), PlayerName(name: "C"), PlayerName(name: "D")],
            factions: [Faction(name: "X", size: 3), Faction(name: "Y", size: 1)]
        )
    }
}
