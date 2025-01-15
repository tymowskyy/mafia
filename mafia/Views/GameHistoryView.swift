//
//  GameHistoryView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//


import SwiftUI

struct GameHistoryView: View {
    @EnvironmentObject private var coordinator: GameCoordinator
    @ObservedObject private var viewModel: GameHistoryViewModel
    
    init(viewModel: GameHistoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.gameHistory) {
            game in
            HStack {
                Text(viewModel.formattedDate(game))
                Spacer()
                Text(viewModel.factionProportions(game))
            }
            .swipeActions {
                Button {
                    coordinator.resumeGame(game)
                }
                label: {
                    Label("Resume", systemImage: "rectangle.portrait.and.arrow.forward")
                }
                
                Button {
                    coordinator.newGameFromState(game)
                }
                label: {
                    Label("Start New", systemImage: "list.bullet.rectangle.portrait")
                }
            }

        }
        .navigationTitle("GameHistory")
    }
}

#Preview {
    NavigationStack {
        GameHistoryView(viewModel: GameHistoryViewModel(repository: InMemoryGameHistoryRepository.example()))
            .navigationBarTitleDisplayMode(.inline)
    }
}
