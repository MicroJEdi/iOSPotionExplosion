//
//  TakeIngredientPenalty.swift
//  PotionExplosion
//
//  Created by John Edison on 7/26/24.
//

import Foundation

enum TokenType: CaseIterable {
    case TakeIngredientPenalty
    case CompleteFiveDifferentPotionsReward
    case CompleteThreeSameTypePotionsReward
}

struct Token: Identifiable, Hashable {
    var id: UUID = UUID()
    var tokenType: TokenType
    var tokenValue: Int
    
    init(tokenType: TokenType) {
        self.tokenType = tokenType
        switch tokenType {
        case .TakeIngredientPenalty:
            self.tokenValue = -2
        case .CompleteFiveDifferentPotionsReward:
            self.tokenValue = 4
        case .CompleteThreeSameTypePotionsReward:
            self.tokenValue = 4
        }
        
    }
}




