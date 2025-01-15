//
//  PlayerName.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 09/01/2025.
//

import Foundation

struct PlayerName: Codable, Identifiable {
    var id = UUID()
    var name: String
}
