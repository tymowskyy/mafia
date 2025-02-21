//
//  GameOptionsView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 10/01/2025.
//

import SwiftUI

struct GameOptionsView: View {
    
    @EnvironmentObject private var coordinator: GameCoordinator
    @ObservedObject private var viewModel: GameOptionsViewModel
    private var playerNameViewModel: PlayerNameSelectionViewModel
    private var factionViewModel: FactionSelectionViewModel
    
    init(viewModel: GameOptionsViewModel) {
        self.viewModel = viewModel
        playerNameViewModel = PlayerNameSelectionViewModel(repository: viewModel.repository)
        factionViewModel = FactionSelectionViewModel(repository: viewModel.repository)
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("\(viewModel.numberOfPlayers()) / \(viewModel.numberOfRoles()) players")
                Button(action: { coordinator.startGame(viewModel.gameOptions) })
                {
                    Image(systemName: "arrowshape.right")
                }
                .disabled(!viewModel.canStartGame())
                Spacer()
            }
            .padding(.leading)
            TabView {
                Tab("Players", systemImage: "person.3") {
                    PlayerNameSelectionView(viewModel: playerNameViewModel)
                }
          
                Tab("Factions", systemImage: "flag.2.crossed") {
                    FactionSelectionView(viewModel: factionViewModel)
                }
       
            }
        }
        .navigationTitle("Game Options")
    }
}

#Preview {
    NavigationStack {
        GameOptionsView(
            viewModel: GameOptionsViewModel(repository: GameOptionsRepository(gameOptions: GameOptions.exampleIncomplete()))
        ).navigationBarTitleDisplayMode(.inline)
    }
}
