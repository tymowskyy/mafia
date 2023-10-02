//
//  ContentView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 07/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var players: [String] = []
    @State private var new_player: String = ""
    @State private var n_mafia: Int = 0
    
    var body: some View {
        VStack {
            Text("Hello, mafia!")
                .font(.largeTitle)
            List {
                ForEach(players, id: \.self) { player in
                    Text(player)
                }.onDelete { indexSet in
                    players.remove(atOffsets: indexSet)
                }.onMove { from, to in
                    players.move(fromOffsets: from, toOffset: to)
                }
                
                TextField(
                    "New player",
                    text: $new_player
                )
                .onSubmit {
                    if (new_player != "") {
                        players.append(new_player)
                        new_player = ""
                    }
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            }
            Stepper("\(n_mafia) mafiosi \(players.count - n_mafia) villagers", value: $n_mafia, in: 0...players.count)
            Button("Play") {
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
