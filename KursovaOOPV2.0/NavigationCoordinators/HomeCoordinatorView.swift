//
//  HomeCoordinatorView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(homePage: .cardListView)
                .tabItem {
                    Image(systemName: "house.circle").resizable().scaledToFit().frame(width: 22)
                }
                .navigationDestination(for: HomePage.self) { homePage in
                    coordinator.build(homePage: homePage)
                }
        }
    }
}

#Preview {
    HomeCoordinatorView()
}
