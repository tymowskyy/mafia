//
//  HomeView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 12/01/2025.
//

import SwiftUI

enum Screen: Hashable {
    case history
    case options(GameOptions = GameOptions())
    case game(GameState)
}


struct HomeView: View {
    
    @EnvironmentObject var coordinator: GameCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Text("Home!")
                    .font(.largeTitle)
                    .bold()

                Button("Start Game!")
                {
                    coordinator.goTo(Screen.options())
                }
                Button("History")
                {
                    coordinator.goTo(Screen.history)
                }
            }
            .navigationDestination(for: Screen.self) { destination in
                switch destination {
                case .history:
                    GameHistoryView(viewModel: GameHistoryViewModel(repository: coordinator.gameHistoryRepository))
                case .options(let gameOptions):
                    GameOptionsView(viewModel: GameOptionsViewModel(repository: GameOptionsRepository(gameOptions: gameOptions)))
                case.game(let gameState):
                    GameView(viewModel: GameViewModel(gameState: gameState))
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(GameCoordinator(gameHistoryRepository: InMemoryGameHistoryRepository()))
}
