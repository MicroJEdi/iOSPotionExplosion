//
//  TurnActions.swift
//  PotionExplosion
//
//  Created by John Edison on 7/28/24.
//

import SwiftUI
import SwiftData

struct TurnActions: View {
    
    @EnvironmentObject var state: GameContext
    
    func HandleIngredientButtonClick() -> Void {

    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Button( action: {
                
            }) {
                Text("Take Igredient")
                    .lineLimit(2)
                    .font(.title3)
                    .bold()
                    .padding(5)
            }
            .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.0))
            .padding(5)
            
            HStack{
                Text(" Type:")
                    .lineLimit(1)
                IngredientSelectionTypePicker(turnState: ActionType.SelectCascadingIngredient, turnDisplayName: "Cascading")
                IngredientSelectionTypePicker(turnState: ActionType.SelectSingleIngredient, turnDisplayName: "Single")
            }
            .border(Color.black, width: 3.0)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .border(Color.black, width: 3.0)
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
