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
    @State var a: Int = 0
    
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
            
            Text("\(viewModel.numberOfPlayers()) players")
        }
    }
}

#Preview {
    GameView(viewModel: GameViewModel.example())
}
