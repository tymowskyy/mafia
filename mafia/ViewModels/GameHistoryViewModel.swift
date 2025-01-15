//
//  GameHistoryViewModel.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 15/01/2025.
//

import Foundation
import Combine

class GameHistoryViewModel: ObservableObject {
    @Published var gameHistory: [GameState] = []
    var repository: any GameHistoryRepository
    
    private let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
           return formatter
       }()

    init(repository: any GameHistoryRepository) {
        self.repository = repository
        fetch()
    }
    
    func formattedDate(_ game: GameState) -> String {
        return dateFormatter.string(from: game.date)
    }
    
    func factionProportions(_ game: GameState) -> String {
        game.factions.map({ String($0.size) }).joined(separator: "/")
    }
    
    func fetch() {
        gameHistory = repository.fetchGames()
    }
}
