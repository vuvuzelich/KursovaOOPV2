//
//  TeamView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 07.03.2024.
//

import SwiftUI

struct TeamView: View {
    @Environment(\.modelContext) private var context
    @State private var confirmDeletingTeam = false
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Bindable var team: TeamModel
    
    var body: some View {
        VStack {
            Text(team.teamName)
            Button(action: {
                confirmDeletingTeam.toggle()
            }, label: {
                Text("Delete Card")
            })
            .confirmationDialog("Are you sure?", isPresented: $confirmDeletingTeam) {
                Button {
                } label: {
                    Label("Більше інформації", systemImage: "questionmark.circle")
                }
                Button("Видалити картку", role: .destructive) {
                    context.delete(team)
                    coordinator.pop()
                }
            }
            .padding()
        }
    }
}


