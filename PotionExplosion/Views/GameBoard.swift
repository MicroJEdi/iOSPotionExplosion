//
//  GameBoard.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct GameBoard: View {
    
    @State var displaySheet: Bool = false
    @State var clickedButton: Bool = false
    @State var selectedIngredient: Ingredient? = nil
    
    @EnvironmentObject var state: GameBoardContext
    
    var body: some View {
        
        GeometryReader { reader in
            HStack {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(self.state.ingredients, id:\.self) { columnIngredients in
                        VStack(spacing: 0) {
                            ForEach(0..<state.numRows, id:\.self) { i in
                                
                                Button( action: {
                                    selectedIngredient = columnIngredients[state.numRows-1-i]
                                    displaySheet = true
                                }) {
                                        Circle()
                                            .fill(columnIngredients[state.numRows-1-i].color)
                                }
                                .buttonStyle(IngredientButton())
                                .onHover(perform: { hovering in
                                    withAnimation {
                                        
                                    }
                                })
                                
                            }
                        }
                    }
                }
                .background(Color(red: 0.7, green: 0.4, blue: 0.2, opacity: 1.0))
                .overlay {
                    if displaySheet {
                        GeometryReader { geometry in
                            VStack {
                                Spacer()
                                VStack {
                                    Text("Ingedient At")
                                        .foregroundStyle(Color.white)
                                        .font(.title)
                                        .bold()
                                    Text("Row: \(selectedIngredient?.row ?? 0)")
                                        .foregroundStyle(Color.white)
                                        .font(.title2)
                                        .bold()
                                    Text("Column: \(selectedIngredient?.column ?? 0)")
                                        .foregroundStyle(Color.white)
                                        .font(.title2)
                                        .bold()
                                    Button("Cascading Pickup") {
                                        withAnimation {
                                            displaySheet = false
                                        }
                                    }
                                    .buttonStyle(GrowingButton())
                                    Button("Penalty Pickup") {
                                        withAnimation {
                                            displaySheet = false
                                        }
                                    }
                                    .buttonStyle(GrowingButton())
                                    Button("Cancel") {
                                        withAnimation {
                                            displaySheet = false
                                        }
                                    }
                                    .buttonStyle(GrowingButton())
                                }
                                .frame(width: geometry.size.width)
                                .background(selectedIngredient?.color)
                                Spacer()
                            }
//                            .onTapGesture {
//                                displaySheet = false
//                            }
                        }
                    }
                }
                Spacer()
            }
        }
        .scaledToFill()
        
    }
    
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
