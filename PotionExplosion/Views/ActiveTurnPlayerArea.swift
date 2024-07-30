//
//  PlayerArea.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct ActiveTurnPlayerArea: View {
    
    @EnvironmentObject var state: GameContext

    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                IngredientPool()
                Spacer()
                VStack {
                    CompletedPotions()
                        .border(Color.black, width: 3.0)
                    HStack {
                        SavedIngredients()
                        IncompletePotions()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        
    }
    
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
