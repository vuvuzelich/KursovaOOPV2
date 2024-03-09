//
//  KursovaOOPV2_0App.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

@main
struct KursovaOOPV2_0App: App {
    @StateObject var userViewModel = UserViewModel()
//    @StateObject var cardViewModel = CardViewModel()    
    @StateObject private var settingsCoordinator = SettingsCoordinator()
    @StateObject private var homeCoordinator = HomeCoordinator()
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(container)
                .preferredColorScheme(.dark)
                .environmentObject(userViewModel)
//                .environmentObject(cardViewModel)
                .environmentObject(homeCoordinator)
                .environmentObject(settingsCoordinator)
        }
        
    }
    
    init() {
        let schema = Schema([Card.self, TeamModel.self])
        let config = ModelConfiguration("MyCards", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
