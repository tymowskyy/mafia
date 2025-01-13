//
//  GameCoordinator.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import Foundation


class GameCoordinator: ObservableObject {
    @Published var gameState: GameState = .options
    let gameOptionsRepository: GameOptionsRepository = GameOptionsRepository()
    
    func startGame() {
        gameState = .game
    }
}
