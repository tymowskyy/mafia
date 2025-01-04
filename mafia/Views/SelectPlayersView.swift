//
//  SelectPlayersView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 04/01/2025.
//

import SwiftUI

struct SelectPlayersView: View {
    
    @StateObject private var viewModel: SelectPlayersViewModel
    @State private var newPlayerName: String = ""
    
    init(viewModel: SelectPlayersViewModel = SelectPlayersViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Select Players")
                .font(.largeTitle)
                .padding(.top)

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
            
            Text("\(viewModel.players.count) players")
        }
    }
    
}

#Preview {
    SelectPlayersView(viewModel: SelectPlayersViewModel.example())
}

