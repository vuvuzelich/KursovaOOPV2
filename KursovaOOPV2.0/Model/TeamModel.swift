//
//  TeamModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class TeamModel {
    var card : [Card]?
    var teamName : String
    
    init(teamName: String) {
        self.teamName = teamName
    }
    

}



class TeamViewModel: ObservableObject {
    @Published var teams: [TeamModel] = []

}
