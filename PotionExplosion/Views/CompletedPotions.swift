//
//  CompletedPotions.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct CompletedPotions: View {
    
    @EnvironmentObject var state: PlayersContext
    
    func GetActiveTurnPlayerContext() -> PlayerContext {
        return self.state.playerContexts[self.state.activeTurnPlayerIndex]
    }
    
    func GetUsedPotionTypeCount(potionType: PotionType) -> Int {
        return GetActiveTurnPlayerContext().usedCompletePotions.reduce(0, {
            $0 + (($1.potionType == potionType) ? 1 : 0)
        })
    }
    
    func GetUnusedPotionTypeCount(potionType: PotionType) -> Int {
        return GetActiveTurnPlayerContext().unusedCompletePotions.reduce(0, {
            $0 + (($1.potionType == potionType) ? 1 : 0)
        })
    }
    
    func GetTotalPotionTypeCount(potionType: PotionType) -> Int {
        return GetUsedPotionTypeCount(potionType: potionType) + GetUnusedPotionTypeCount(potionType: potionType)
    }
    
    var body: some View {
        HStack {
            ForEach(Array(zip(PotionType.allCases.indices, PotionType.allCases)), id: \.0) { (index, item) in
                VStack {
                    Text("\(GetUnusedPotionTypeCount(potionType: item)) / \(GetTotalPotionTypeCount(potionType: item))")
//                    Text("\(Potion.PotionTypeColorMap[item]!.0)")
//                        .bold()
//                        .padding(5)
                }
                .background(Potion.PotionTypeColorMap[item]!.1)
            }
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
