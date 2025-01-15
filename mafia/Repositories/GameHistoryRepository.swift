//
//  GameHistoryRepository.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//

import Foundation

protocol GameHistoryRepository: ObservableObject {
    func fetchGames() -> [GameState]
    
    func addGame(_ game: GameState)
}

class InMemoryGameHistoryRepository: GameHistoryRepository {
    private var gameHistory: [GameState] = []
    
    func fetchGames() -> [GameState] {
        return gameHistory
    }
    
    func addGame(_ game: GameState) {
        gameHistory.append(game)
    }
}


extension InMemoryGameHistoryRepository {
    static func example() -> any GameHistoryRepository {
        let repository = InMemoryGameHistoryRepository()
        repository.addGame(GameOptions.exampleReadyToStart().toGameState())
        repository.addGame(GameOptions.exampleReadyToStart().toGameState())
        repository.addGame(GameOptions.exampleReadyToStart().toGameState())
        return repository
    }
}
