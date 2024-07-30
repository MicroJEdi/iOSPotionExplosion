//
//  OpponentHands.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct PlayersInformation: View {
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ForEach(0..<self.state.playerContexts.count, id: \.self) { i in
                VStack(spacing: 0) {
                    Text("\(self.state.playerContexts[i].name)")
                        .bold()
                        .font(.title3)
                        .padding(.horizontal)
                    HStack {
                        ForEach(0..<self.state.numSavedIngredients, id: \.self) { j in
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                                .fill((j < self.state.playerContexts[i].storedIngredients.count) ? self.state.playerContexts[i].storedIngredients[j].color : Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 1.0))
                                .frame(width: self.state.ingredientWidth)
                        }
                    }
                }
                .padding(.vertical)
                .background(self.state.playerContexts[i].isActivePlayer ? Color(red: 0.3, green: 0.7, blue: 0.9, opacity: 0.7) : Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.0))
                .border(self.state.playerContexts[i].isActivePlayer ? Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 1.0) : Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.0), width: 2)
            }
        }
        
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
