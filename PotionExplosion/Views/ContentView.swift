//
//  ContentView.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @StateObject var state: GameContext = GameContext()

    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    PlayersInformation()
                    GameBoard()
                }
                TurnActions()
                ActiveTurnPlayerArea()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Potion Explosion")
                        .font(.title)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .environmentObject(state)
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
