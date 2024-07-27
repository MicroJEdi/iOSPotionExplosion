//
//  SavedIngredients.swift
//  PotionExplosion
//
//  Created by John Edison on 7/27/24.
//

import SwiftUI
import SwiftData

struct SavedIngredients: View {
    
    let state: PlayerContext
    var numIngredients: Int
    var color: Color
    var ingredientWidth: CGFloat
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(0..<numIngredients) { _ in
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .fill(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
                    .frame(width: self.ingredientWidth)
                    .padding(2)
                Spacer()
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(color)
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
