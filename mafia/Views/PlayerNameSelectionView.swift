//
//  PlayerNameSelectionView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 04/01/2025.
//

import SwiftUI

struct PlayerNameSelectionView: View {
    
    @ObservedObject var viewModel: PlayerNameSelectionViewModel
    @State private var newPlayerName: String = ""
    
    init(viewModel: PlayerNameSelectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.playerNames, id: \.id) {
                player in
                Text("\(player.name)")
            }
            .onDelete(perform: viewModel.removePlayer)
            .onMove(perform: viewModel.movePlayer)
            
            HStack {
                TextField("Enter player's name", text: $newPlayerName)
                
                Button(action: {
                    if !newPlayerName.isEmpty {
                        viewModel.addPlayer(name: newPlayerName)
                    }
                    newPlayerName = ""
                }) {
                    Image(systemName: "plus")
                    
                }
            }
            
        }
        .background()
    }
}
