//
//  Game.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 02/01/2025.
//

import Foundation

struct Faction: Identifiable {
    var id = UUID()
    var name: String
    var size: Int = 0
}
