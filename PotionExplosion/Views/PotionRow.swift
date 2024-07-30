//
//  PotionRow.swift
//  PotionExplosion
//
//  Created by John Edison on 7/25/24.
//

import SwiftUI
import SwiftData

struct PotionRow: View {
    
    let numIngredients: Int
    let color: Color
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        HStack {
            ForEach(0..<self.numIngredients, id: \.self) { _ in
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .fill(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 1.0))
                    .frame(width: self.state.ingredientWidth)
                    .padding(3)
            }
        }
        .background(color)
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}

