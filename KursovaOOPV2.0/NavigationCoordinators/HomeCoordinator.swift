//
//  HomeCoordinator.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI

enum HomePage : String, Identifiable {
    
    case cardListView, cardList, updateHeaderView, createCardView, editCardView, additionalFuncionalityCard, buttonDeleteCard, deleteCardView, addTeamView, teamView
    
    var id: String {
        self.rawValue
    }
}






class HomeCoordinator : ObservableObject {
    
    @Published var path = NavigationPath()

    var selectedCard: Card?
    
    var selectedTeam: TeamModel?
    
    func push(_ homePage : HomePage) {
        path.append(homePage)
    }
    
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    
    
    @ViewBuilder
    func build(homePage: HomePage) -> some View {
        switch homePage {
        case .cardListView:
            CardListView()
        case .cardList:
            CardList()
        case .updateHeaderView:
            UpdateHeaderView()
        case .createCardView:
            CreateCardView()
        case .editCardView:
            CardView(card : selectedCard ?? Card(color: "нет карті", name: "no name", coins: "NOL"))
        case .additionalFuncionalityCard:
            AdditionalFuncionalityCard(card : selectedCard ?? Card(color: "нет карті", name: "no name", coins: "NOL"))
        case .buttonDeleteCard:
            ButtonDeleteCard(card : selectedCard ?? Card(color: "нет карті", name: "no name", coins: "NOL"))
        case .deleteCardView:
            DeleteCardView(card : selectedCard ?? Card(color: "нет карті", name: "no name", coins: "NOL"))
        case .addTeamView:
            AddTeamView()
        case .teamView:
            TeamView(team: selectedTeam ?? TeamModel(teamName: "Note"))
        }
    }


    
}


