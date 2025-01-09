//
//  ContentView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import SwiftUI

struct GameOptionsView: View {
    @StateObject private var viewModel: GameOptionsViewModel
    @State private var newFactionName: String = ""
    
    init(viewModel: GameOptionsViewModel = GameOptionsViewModel()) {
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
                        Stepper("\(faction.name): \(faction.size)", value: Binding(
                            get: { faction.size },
                            set: { newSize in
                                viewModel.updateFactionSize(faction: faction, size: newSize)
                            }
                        ), in: 0...Int.max)
        
                    }
                }
                .onDelete(perform: viewModel.removeFaction)
            }
            Spacer()
            
            Text("\(viewModel.numberOfRoles()) / \(viewModel.players.count)")
        }
        .navigationTitle("Faction Selection")
    }
}

#Preview {
    NavigationStack {
        GameOptionsView(viewModel: GameOptionsViewModel.example())
    }
}
