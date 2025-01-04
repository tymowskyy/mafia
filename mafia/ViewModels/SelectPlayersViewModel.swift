//
//  GameViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation

class SelectPlayersViewModel: ObservableObject {
    
    @Published var players: [Player] = []
    
    func addPlayer(name: String) {
        players.append(Player(name: name))
    }
    
    func removePlayer(at offsets: IndexSet) {
        players.remove(atOffsets: offsets)
    }
    
    func movePlayer(from source: IndexSet, to destination: Int) {
        players.move(fromOffsets: source, toOffset: destination)
    }
    
    static func example() -> SelectPlayersViewModel {
        let viewModel = SelectPlayersViewModel()
        viewModel.players = [
            Player(name: "John"),
            Player(name: "Smith")
        ]
        return viewModel
    }

}
