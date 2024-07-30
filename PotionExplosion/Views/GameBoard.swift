//
//  GameBoard.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct GameBoard: View {
    
    @EnvironmentObject var state: GameContext
    
    var body: some View {
        
        ViewThatFits {
            HStack(spacing: 0) {
                ForEach(0..<self.state.numColumns, id: \.self) { columnIndex in
                    VStack(spacing: 0) {
                        ForEach(0..<self.state.numRows, id: \.self) { rowIndex in
                            Button( action: {
                                if self.state.isIngredientSelected && self.state.selctedGameBoardIngredientRow == rowIndex &&
                                    self.state.selctedGameBoardIngredientColumn == columnIndex {
                                    self.state.isIngredientSelected = false
                                    self.state.selctedGameBoardIngredientRow = -1
                                    self.state.selctedGameBoardIngredientColumn = -1
                                }
                                else {
                                    self.state.isIngredientSelected = true
                                    self.state.selctedGameBoardIngredientRow = rowIndex
                                    self.state.selctedGameBoardIngredientColumn = columnIndex
                                }
                            }) {
                                Circle()
                                    .fill(self.state.gameBoardIngredients[columnIndex][rowIndex].color)
                                    .stroke(Color.white, lineWidth: (self.state.isIngredientSelected && self.state.selctedGameBoardIngredientRow == rowIndex &&
                                                                     self.state.selctedGameBoardIngredientColumn == columnIndex) ? 6.0 : 0.0)
                                    .padding(2)
                            }
                        }
                    }
                    .padding(2)
                }
            }
            .coordinateSpace(name: "GameBoard")
            .background(Color(red: 0.7, green: 0.4, blue: 0.2, opacity: 1.0))
            .rotationEffect(.degrees(180))
        }
        
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
