//
//  mafiaApp.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import SwiftUI

@main
struct mafiaApp: App {
    
    @StateObject private var gameHistoryRepository = InMemoryGameHistoryRepository()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(gameHistoryRepository)
                .environmentObject(GameHistoryViewModel(repository: gameHistoryRepository))
        }
    }
}
