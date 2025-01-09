//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation

class FactionListViewModel: ObservableObject {
    
    @Published var factions: [Faction] = []
    @Published var playerNames: [PlayerName] = []
    
    init(playerNames: [PlayerName] = []) {
        self.playerNames = playerNames
    }
    
    func addFaction(name: String) {
        factions.append(Faction(name: name))
    }
    
    func removeFaction(at offsets: IndexSet) {
        factions.remove(atOffsets: offsets)
    }
    
    func numberOfRoles() -> Int {
        return factions.reduce(0, { $0 + $1.size })
    }
    
    func updateFactionSize(faction: Faction, size: Int) {
        if let index = factions.firstIndex(where: { $0.id == faction.id }) {
            factions[index].size = size
        }
    }
    
    func canStartGame() -> Bool {
        return numberOfRoles() == playerNames.count
    }
    
    func createGameViewModel() -> GameViewModel {
        GameViewModel(playerNames: playerNames, factions: factions)
    }
    
    static func example() -> FactionListViewModel {
        let viewModel = FactionListViewModel()
        viewModel.factions = [
            Faction(name: "mafiosi", size: 2),
            Faction(name: "villagers", size: 7)
        ]
        return viewModel
    }

}
