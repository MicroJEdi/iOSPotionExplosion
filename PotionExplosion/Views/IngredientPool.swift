//
//  IngredientPool.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct IngredientPool: View {
    
    @EnvironmentObject var state: GameContext
    
    func GetIngredientTypeCount(ingredientType: IngredientType) -> Int {
        return self.state.playerContexts[self.state.activePlayerIndex].collectedIngredients.reduce(0, {
            $0 + (($1.ingredientType == ingredientType) ? 1 : 0)
        })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ForEach(Array(zip(IngredientType.allCases.indices, IngredientType.allCases)), id: \.0) { (index, item) in
                    HStack {
                        Text("\( self.GetIngredientTypeCount(ingredientType: item ))")
                        Circle()
                            .fill(Ingredient.IngredientTypeColorMap[item] ?? Color.white)
                            .frame(width: self.state.ingredientWidth)
                    }
                }
            }
        }
        .padding(5)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
