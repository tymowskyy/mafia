//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var factions: [Faction] = []
    
    func addFaction(name: String) {
        factions.append(Faction(name: name))
    }
    
    func removeFaction(at offsets: IndexSet) {
        factions.remove(atOffsets: offsets)
    }
    
    func numberOfPlayers() -> Int {
        return factions.reduce(0, { $0 + $1.size })
    }
    
    func updateFactionSize(faction: Faction, size: Int) {
        if let index = factions.firstIndex(where: { $0.id == faction.id }) {
            factions[index].size = size
        }
    }
    
    static func example() -> GameViewModel {
        let viewModel = GameViewModel()
        viewModel.factions = [
            Faction(name: "mafiosi", size: 2),
            Faction(name: "villagers", size: 7)
        ]
        return viewModel
    }

}
