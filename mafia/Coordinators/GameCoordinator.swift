//
//  GameCoordinator.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import Foundation


class GameCoordinator: ObservableObject {
    @Published var gameState: GameFlowState = .options
    private var gameHistoryRepository: any GameHistoryRepository
    private(set) var gameOptionsRepository: GameOptionsRepository = GameOptionsRepository()
    
    init(gameHistoryRepository: any GameHistoryRepository) {
        self.gameHistoryRepository = gameHistoryRepository
    }
    
    func newGame() {
        gameState = .options
        gameOptionsRepository = GameOptionsRepository()
    }
    
    func startGame() {
        gameState = .game
    }
    
    func endGame(gameState: GameState) {
        print("add")
        gameHistoryRepository.addGame(gameState)
        self.gameState = .options
        gameOptionsRepository = GameOptionsRepository()
    }
}
