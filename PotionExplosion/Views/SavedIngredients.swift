//
//  SavedIngredients.swift
//  PotionExplosion
//
//  Created by John Edison on 7/27/24.
//

import SwiftUI
import SwiftData

struct SavedIngredients: View {
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        VStack {
            ForEach(0..<self.state.numSavedIngredients, id: \.self) { _ in
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .fill(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 1.0))
                    .frame(width: self.state.ingredientWidth)
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
