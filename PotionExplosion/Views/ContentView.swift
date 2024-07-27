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
    
    @StateObject var appContext: AppContext = AppContext()

    var body: some View {
        NavigationStack {
            GameLayout()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Potion Explosion")
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .environmentObject(appContext)
            .environmentObject(appContext.gameContext)
            .environmentObject(appContext.gameContext.gameBoardContext)
            .environmentObject(appContext.gameContext.playersContext)
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
