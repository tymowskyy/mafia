//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var gameState: GameState
    
    init(gameState: GameState) {
        self.gameState = gameState
    }
    
    func assingFactions() {
        let playersShuffled = gameState.players.shuffled()
        var factionIndex = 0
        var playerInFaction = 0
        
        for i in 0...gameState.players.count-1 {
            if let index = gameState.players.firstIndex(where: { $0.id == playersShuffled[i].id }) {
                gameState.players[index].faction = gameState.factions[factionIndex]
            }
            playerInFaction += 1
            if playerInFaction >= gameState.factions[factionIndex].size {
                playerInFaction = 0
                factionIndex += 1
            }
        }
    }
    
    func togglePlayerAlive(player: Player) {
        if let index = gameState.players.firstIndex(where: { $0.id == player.id }) {
            gameState.players[index].isAlive.toggle()
        }
    }
}
