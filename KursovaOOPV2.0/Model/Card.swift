//
//  Card.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Card {
    var color: String
    var name : String
    var coins : String
    @Relationship(inverse : \TeamModel.teamName)
    
    init(color: String, name: String, coins: String) {
        self.color = color
        self.name = name
        self.coins = coins
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}


//class CardsViewModel: ObservableObject {
//    @Published var cards: [Card] = []
//}




