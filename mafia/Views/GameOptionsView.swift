//
//  GameOptionsView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import SwiftUI

struct GameOptionsView: View {
    
    @ObservedObject private var viewModel: GameOptionsViewModel
    private var playerListViewModel: PlayerListViewModel
    private var factionListViewModel: FactionListViewModel
    let onGameStart: () -> Void
    
    init(viewModel: GameOptionsViewModel, onGameStart: @escaping () -> Void) {
        self.viewModel = viewModel
        playerListViewModel = PlayerListViewModel(repository: viewModel.repository)
        factionListViewModel = FactionListViewModel(repository: viewModel.repository)
        self.onGameStart = onGameStart
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("\(viewModel.numberOfPlayers()) / \(viewModel.numberOfRoles()) players")
                Button(action: onGameStart)
                {
                    Image(systemName: "arrowshape.right")
                }
                .disabled(!viewModel.canStartGame())
                Spacer()
            }
            .padding(.leading)
            TabView {
                Tab("Players", systemImage: "person.3") {
                    PlayerListView(viewModel: playerListViewModel)
                }
          
                Tab("Factions", systemImage: "flag.2.crossed") {
                    FactionListView(viewModel: factionListViewModel)
                }
       
            }
        }
        .navigationTitle("Game Options")
    }
}

#Preview {
    NavigationStack {
        GameOptionsView(
            viewModel: GameOptionsViewModel(repository: GameOptionsRepository.exampleIncomplete())
        ){}.navigationBarTitleDisplayMode(.inline)
    }
}
