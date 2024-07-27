//
//  IngredientPool.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct IngredientPool: View {
    
    let state: PlayerContext
    
    func GetIngredientTypeCount(ingredientType: IngredientType) -> Int {
        return self.state.collectedIngredients.reduce(0, {
            $0 + (($1.ingredientType == ingredientType) ? 1 : 0)
        })
    }
    
    var body: some View {
        VStack {
            VStack {
                ForEach(Array(zip(IngredientType.allCases.indices, IngredientType.allCases)), id: \.0) { (index, item) in
                    HStack {
                        Text("\( self.GetIngredientTypeCount(ingredientType: item ))")
                        Circle()
                            .frame(width: 20.0)
                            .foregroundColor(Ingredient.IngredientTypeColorMap[item])
                    }
                }
            }
            .scaledToFit()
            .padding(5)
        }
        .background(Color(red: 0.0, green: 0.0, blue: 1.0, opacity: 0.2))
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
