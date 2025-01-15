//
//  GameCoordinator.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import Foundation
import SwiftUI

class GameCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    private(set) var gameHistoryRepository: any GameHistoryRepository
    
    init(gameHistoryRepository: GameHistoryRepository) {
        self.gameHistoryRepository = gameHistoryRepository
    }
    
    func goTo(_ screen: Screen) {
        path.removeLast(path.count)
        path.append(screen)
    }
    
    func startGame(_ options: GameOptions) {
        goTo(.game(options.toGameState()))
    }
    
    func endGame(_ gameState: GameState) {
        gameHistoryRepository.addGame(gameState)
        path.removeLast(path.count)
    }
}
