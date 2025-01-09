//
//  GameView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
