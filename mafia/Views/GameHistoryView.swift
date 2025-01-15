//
//  GameHistoryView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//


import SwiftUI

struct GameHistoryView: View {
    @EnvironmentObject private var viewModel: GameHistoryViewModel
    
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
        GameHistoryView()
            .environmentObject(GameHistoryViewModel(repository: InMemoryGameHistoryRepository.example()))
            .navigationBarTitleDisplayMode(.inline)
    }
}
