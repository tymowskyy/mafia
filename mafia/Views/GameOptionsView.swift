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
    
    init(gameOptionsRepository: GameOptionsRepository) {
        _viewModel = ObservedObject(wrappedValue: GameOptionsViewModel(repository: gameOptionsRepository))
        playerListViewModel = PlayerListViewModel(repository: gameOptionsRepository)
        factionListViewModel = FactionListViewModel(repository: gameOptionsRepository)
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("\(viewModel.numberOfPlayers()) / \(viewModel.numberOfRoles()) players")
                NavigationLink {
                    GameView(viewModel: GameViewModel(
                        gameOptions: viewModel.repository
                    ))
                } label: {
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
            gameOptionsRepository: GameOptionsRepository.exampleIncomplete()
        )
    }
}
