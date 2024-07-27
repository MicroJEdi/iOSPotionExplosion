//
//  IncompletePotions.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct IncompletePotions: View {
    
    let state: PlayerContext
    var ingredientWidth: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(state.incompletePotions) { potion in
                    ZStack {
                        Rectangle()
                            .fill(Color.mint)
                            .frame(
                                width: (geometry.size.width/CGFloat(state.incompletePotions.count)),
                                height: (geometry.size.height)
                            )
                        VStack {
                            Text("Potion")
                                .font(.headline)
                                .padding(10)
                            Spacer()
                            if potion.numBlack > 0 {
                                PotionRow(numIngredients: potion.numBlack, color: Color.black, ingredientWidth: self.ingredientWidth)
                            }
                            if potion.numBlue > 0 {
                                PotionRow(numIngredients: potion.numBlue, color: Color.blue, ingredientWidth: self.ingredientWidth)
                            }
                            if potion.numRed > 0 {
                                PotionRow(numIngredients: potion.numRed, color: Color.red, ingredientWidth: self.ingredientWidth)
                            }
                            if potion.numYellow > 0 {
                                PotionRow(numIngredients: potion.numYellow, color: Color.yellow, ingredientWidth: self.ingredientWidth)
                            }
                        }
                        .frame(alignment: .top)
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
