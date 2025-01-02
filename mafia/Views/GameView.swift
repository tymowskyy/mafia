//
//  ContentView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    @State private var newFactionName: String = ""
    
    init(viewModel: GameViewModel = GameViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter new faction", text: $newFactionName)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                
                Button(action: {
                    if !newFactionName.isEmpty {
                        viewModel.addFaction(name: newFactionName)
                    }
                    newFactionName = ""
                }) {
                    Image(systemName: "plus")
                    
                }
            }
            .padding()
            List {
                ForEach(viewModel.factions, id: \.id) {
                    faction in
                    HStack {
                        Text(faction.name)
                        Spacer()
                        
                        Button(action: {
                            viewModel.decrement(faction: faction)
                        }) {
                            Image(systemName: "minus")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .disabled(faction.size == 0)
                            

                        Text("\(faction.size)")

                        Button(action: {
                            viewModel.increment(faction: faction)
                        }) {
                            Image(systemName: "plus")
                        }.buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete(perform: viewModel.removeFaction)
            }
            Spacer()
            
            Text("\(viewModel.numberOfPlayers()) players")
        }
    }
}

#Preview {
    GameView(viewModel: GameViewModel.example())
}
