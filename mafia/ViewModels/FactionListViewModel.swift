//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation
import Combine

class FactionListViewModel: ObservableObject {
    @Published var factions: [Faction] = []
    private var repository: GameOptionsRepository
    
    init(repository: GameOptionsRepository) {
        self.repository = repository
        repository.$gameOptions
            .map { $0.factions }
            .receive(on: DispatchQueue.main)
            .assign(to: &$factions)
    }
    
    func addFaction(name: String) {
        repository.addFaction(faction: Faction(name: name))
    }
    
    func removeFaction(at offsets: IndexSet) {
        if let firstIndex = offsets.first {
               repository.removeFaction(at: firstIndex)
           }
    }
    
    func updateFactionSize(faction: Faction, size: Int) {
        if let index = factions.firstIndex(where: { $0.id == faction.id }) {
            repository.changeFactionSize(at: index, newSize: size)
        }
    }
}
