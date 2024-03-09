//
//  SettingsCoordinator.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI




enum Sheet : String, Identifiable {
    case lemon
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover : String, Identifiable {
    case olive
    
    var id: String {
        self.rawValue
    }
}







enum Page : String, Identifiable {
    case apple, banana, carrot
    
    var id: String {
        self.rawValue
    }
}

class SettingsCoordinator : ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet : Sheet?
    @Published var fullScreenCover : FullScreenCover?
    
    func push(_ page : Page) {
        path.append(page)
    }
    
    func present(sheet : Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover : FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    
    @ViewBuilder
    func build(page : Page) -> some View {
        switch page {
        case .apple :
            AppleView()
        case .banana:
            BananaView()
        case .carrot:
            CarrotView()
        }
    }
    
    @ViewBuilder
    func build(sheet : Sheet) -> some View {
        switch sheet {
        case .lemon :
            NavigationStack{
                LemonView()
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover : FullScreenCover) -> some View {
        switch fullScreenCover {
        case .olive :
            NavigationStack{
                OliveView()
            }
        }
    }
    
}
