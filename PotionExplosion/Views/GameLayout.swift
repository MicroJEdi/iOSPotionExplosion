//
//  GameLayout.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct GameLayout: View {
    
    var body: some View {
        VStack() {
            Spacer()
            PlayersInformation()
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.2))
            GameBoard()
            ActiveTurnPlayerArea()
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.2))
            Spacer()
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
