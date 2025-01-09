//
//  SelectPlayersView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 04/01/2025.
//

import SwiftUI

struct PlayerListView: View {
    
    @StateObject private var viewModel: PlayerListViewModel
    @State private var newPlayerName: String = ""
    
    init(viewModel: PlayerListViewModel = PlayerListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.players, id: \.id) {
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
            Spacer()
            
            HStack {

                Text("\(viewModel.players.count) players")
                NavigationLink {
                    GameOptionsView(viewModel: viewModel.createGameViewModel())
                } label: {
                    Image(systemName: "arrowshape.right")
                }
                .disabled(viewModel.players.isEmpty)
            }
        }
        .navigationTitle("Select players")
    }
    
}

#Preview {
    NavigationStack {
        PlayerListView(viewModel: PlayerListViewModel.example())
    }
}

