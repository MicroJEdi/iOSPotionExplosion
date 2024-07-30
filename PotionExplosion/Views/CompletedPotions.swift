//
//  CompletedPotions.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct CompletedPotions: View {
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        VStack {
            Text("Completed Potions")
            HStack(spacing: 0) {
                
                ForEach(Array(zip(PotionType.allCases.indices, PotionType.allCases)), id: \.0) { (index, item) in
                    VStack {
                        
                        Button(action: {
                            self.state.turn.selectedActionType = ActionType.UsePotion
                            self.state.turn.selectedPotionType = item
                        }) {
                            Text("\(self.state.playerContexts[self.state.activePlayerIndex].GetUnusedPotionTypeCount(potionType: item)) / \(self.state.playerContexts[self.state.activePlayerIndex].GetTotalPotionTypeCount(potionType: item))")
                                .font(.title3)
                                .bold()
                                .padding(3)
                        }
                        .background((self.state.turn.selectedActionType == ActionType.UsePotion && self.state.turn.selectedPotionType == item) ? Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.25) : Potion.PotionTypeColorMap[item]!.1)
                    }
                }
            }
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
