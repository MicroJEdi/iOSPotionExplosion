//
//  IngredientButton.swift
//  PotionExplosion
//
//  Created by John Edison on 7/27/24.
//

import Foundation
import SwiftUI

struct IngredientButton: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(configuration.isPressed ? AnyShape(Circle()) : AnyShape(Capsule()))
            .scaleEffect(configuration.isPressed ? 2.0 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
