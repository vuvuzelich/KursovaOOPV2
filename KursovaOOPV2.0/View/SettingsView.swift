//
//  SettingsView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI


struct AppleView: View {
    
    @EnvironmentObject private var coordinator : SettingsCoordinator
    
    var body: some View {
        List {
            Button("Bananna"){
                coordinator.push(.banana)
            }
            Button("lemon"){
                coordinator.present(sheet: .lemon)
            }
            Button("olive"){
                coordinator.present(fullScreenCover: .olive)
            }
        }
    }
}


struct BananaView: View {
    @EnvironmentObject private var coordinator : SettingsCoordinator
    var body: some View {
        List {
            Button("Carrot"){
                coordinator.push(.carrot)
            }
            Button("Pop"){
                coordinator.pop()
            }

        }
    }
}

struct CarrotView: View {
    @EnvironmentObject private var coordinator : SettingsCoordinator
    var body: some View {
        VStack{
            Button("Pop"){
                coordinator.pop()
            }
            Button("PopToRoot"){
                coordinator.popToRoot()
            }
        }
    }
}


struct LemonView: View {
    @EnvironmentObject private var coordinator : SettingsCoordinator
    var body: some View {
        List{
            Button("Dismiss"){
                coordinator.dismissSheet()
            }
        }
        .navigationTitle("🍋")
    }
}

struct OliveView: View {
    @EnvironmentObject private var coordinator : SettingsCoordinator
    var body: some View {
        List {
            Button("Dismiss"){
                coordinator.dismissFullScreenCover()
            }
            
        }
        .navigationTitle("🫒")
    }
}
