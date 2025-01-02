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
    
    func increment(faction: Faction) {
        if let index = factions.firstIndex(where: { $0.id == faction.id }) {
            factions[index].size += 1
        }
    }
    
    func decrement(faction: Faction) {
        if let index = factions.firstIndex(where: { $0.id == faction.id }) {
            if factions[index].size > 0 {
                factions[index].size -= 1
            }
        }
    }
    
    func numberOfPlayers() -> Int {
        return factions.reduce(0, { (result, element) in
            return result + element.size
        })
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
