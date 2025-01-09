//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation

class PlayerListViewModel: ObservableObject {
    
    @Published var playerNames: [PlayerName] = []
    
    func addPlayer(name: String) {
        playerNames.append(PlayerName(name: name))
    }
    
    func removePlayer(at offsets: IndexSet) {
        playerNames.remove(atOffsets: offsets)
    }
    
    func movePlayer(from source: IndexSet, to destination: Int) {
        playerNames.move(fromOffsets: source, toOffset: destination)
    }
    
    func createGameOptionsViewModel() -> GameOptionsViewModel {
        return GameOptionsViewModel(playerNames: playerNames)
    }
    
    static func example() -> PlayerListViewModel {
        let viewModel = PlayerListViewModel()
        viewModel.playerNames = [
            PlayerName(name: "John"),
            PlayerName(name: "Smith")
        ]
        return viewModel
    }

}
