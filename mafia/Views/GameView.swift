//
//  GameView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            List(viewModel.players) {
                player in
                HStack {
                    Image(systemName: player.isAlive
                          ? "largecircle.fill.circle"
                          : "circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        viewModel.togglePlayerAlive(player: player)
                    }
                                  
                    Text(player.name)
                    Spacer()
                    Text(player.faction?.name ?? "")
                }
            }
            Button(action: viewModel.assingFactions) {
                Text("Assign factions")
            }
        }
        .navigationTitle("Game")
    }
}

#Preview {
    NavigationStack {
        GameView(viewModel: GameViewModel(gameOptions: GameOptionsRepository.exampleReadyToStart()))
    }
}
