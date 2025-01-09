//
//  Player.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 04/01/2025.
//


import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var faction: Faction?
}
