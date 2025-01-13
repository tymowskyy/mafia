//
//  HomeView.swift
//  mafia
//
//  Created by Tymoteusz Stępkowski on 12/01/2025.
//

import SwiftUI


struct HomeView: View {

    var body: some View {
        NavigationStack {
            Text("Home!")
                .font(.largeTitle)
                .bold()

            NavigationLink(destination: GameFlowView())
            {
                Text("Start Game!")
            }
        }
    }
}

#Preview {
    HomeView()
}
