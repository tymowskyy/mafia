//
//  GameHistoryView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//


import SwiftUI

struct GameHistoryView: View {
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
        }
        .navigationTitle("GameHistory")
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    NavigationStack {
        GameHistoryView(viewModel: GameHistoryViewModel(repository: InMemoryGameHistoryRepository.example()))
            .navigationBarTitleDisplayMode(.inline)
    }
}
