//
//  GameFlowView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 13/01/2025.
//

import SwiftUI


struct GameFlowView: View {
    
    @EnvironmentObject var coordinator: GameCoordinator
    
    var body: some View {
        switch coordinator.gameState {
        case .options:
            GameOptionsView(viewModel: GameOptionsViewModel(repository: coordinator.gameOptionsRepository))
            {
                coordinator.startGame()
            }
        case .game:
            GameView(viewModel: GameViewModel(gameState: coordinator.gameOptionsRepository.gameOptions.toGameState()), onGameEnd: coordinator.endGame)
        }
    }
}
