//
//  IncompletePotions.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct IncompletePotions: View {
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        
        HStack {
            ForEach(0..<self.state.numIncompletePotions) { i in
                VStack(spacing: 0) {
                    
                    Text("Potion")
                        .font(.headline)
                    
                    PotionRow(numIngredients: self.state.playerContexts[self.state.activePlayerIndex].incompletePotions[i].numBlack, color: Color.black)
                    
                    PotionRow(numIngredients: self.state.playerContexts[self.state.activePlayerIndex].incompletePotions[i].numBlue, color: Color.blue)
                    
                    PotionRow(numIngredients: self.state.playerContexts[self.state.activePlayerIndex].incompletePotions[i].numRed, color: Color.red)
                    
                    PotionRow(numIngredients: self.state.playerContexts[self.state.activePlayerIndex].incompletePotions[i].numYellow, color: Color.yellow)
                    
                }
                .padding(5)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            }
        }
        
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
