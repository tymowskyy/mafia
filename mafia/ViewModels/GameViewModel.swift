//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var players: [Player]
    private var factions: [Faction]
    
    init(gameOptions: GameOptionsRepository) {
        players = gameOptions.playerNames.map {
            player in
            Player(id: player.id, name: player.name, isAlive: true)
        }
        self.factions = gameOptions.factions
    }
    
    func assingFactions() {
        let playersShuffled = players.shuffled()
        var factionIndex = 0
        var playerInFaction = 0
        
        for i in 0...players.count-1 {
            if let index = players.firstIndex(where: { $0.id == playersShuffled[i].id }) {
                players[index].faction = factions[factionIndex]
            }
            playerInFaction += 1
            if playerInFaction >= factions[factionIndex].size {
                playerInFaction = 0
                factionIndex += 1
            }
        }
    }
    
    func togglePlayerAlive(player: Player) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index].isAlive.toggle()
        }
    }
}
