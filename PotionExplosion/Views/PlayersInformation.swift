//
//  OpponentHands.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct PlayersInformation: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("... ToDo Players Info ...")
                        .font(.title)
                        .frame(alignment: .center)
                    Spacer()
                }
                Spacer()
            }
            .frame(alignment: .center)
        }
    }
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
