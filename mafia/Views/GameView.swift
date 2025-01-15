//
//  GameView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel: GameViewModel
    private var onGameEnd: (GameState) -> Void
    
    init(viewModel: GameViewModel, onGameEnd: @escaping (GameState) -> Void) {
        self.viewModel = viewModel
        self.onGameEnd = onGameEnd
    }
    
    var body: some View {
        VStack {
            List(viewModel.gameState.players) {
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
        .onDisappear() {
            onGameEnd(viewModel.gameState)
        }
        
    }
}

#Preview {
    NavigationStack {
        GameView(viewModel: GameViewModel(gameState: GameOptions.exampleReadyToStart().toGameState()))
        {_ in 
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
