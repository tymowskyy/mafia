//
//  PlayerNameSelectionViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 04/01/2025.
//

import Foundation
import Combine

class PlayerNameSelectionViewModel: ObservableObject {
    @Published var playerNames: [PlayerName] = []
    private var repository: GameOptionsRepository
    
    init(repository: GameOptionsRepository) {
        self.repository = repository
        repository.$gameOptions
            .map { $0.playerNames }
            .receive(on: DispatchQueue.main)
            .assign(to: &$playerNames)
    }
    
    func addPlayer(name: String) {
        repository.addPlayer(player: PlayerName(name: name))
    }
    
    func removePlayer(at offsets: IndexSet) {
        if let firstIndex = offsets.first {
            repository.removePlayer(at: firstIndex)
        }
    }
    
    func movePlayer(from source: IndexSet, to destination: Int) {
        if let firstIndex = source.first {
            repository.movePlayer(from: firstIndex, to: destination)
        }
    }
}
