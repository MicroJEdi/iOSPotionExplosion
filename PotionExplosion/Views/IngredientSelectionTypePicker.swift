//
//  IngredientSelectionTypePicker.swift
//  PotionExplosion
//
//  Created by John Edison on 7/29/24.
//

import SwiftUI
import SwiftData

struct IngredientSelectionTypePicker: View {
    
    @State var turnState: ActionType
    @State var turnDisplayName: String
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        
        Button( action: {
            self.state.turn.selectedActionType = turnState
        }) {
            Text("\(self.turnDisplayName)")
                .lineLimit(1)
                .bold()
        }
        .background(self.state.turn.selectedActionType == self.turnState ? Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.15) : Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.0))
        .padding(5)
        .animation(.easeInOut(duration: 0.2), value: self.state.turn.selectedActionType == self.turnState)
        
    }
    
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
