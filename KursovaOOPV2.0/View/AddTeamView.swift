//
//  AddTeamView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 07.03.2024.
//

import SwiftUI

struct AddTeamView: View {
    @State private var teamName = ""
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        VStack{
            TextField("TeamName", text: $teamName)
                .foregroundColor(.blue)
            Button {
                let newteam = TeamModel(teamName: teamName)
                context.insert(newteam)
                coordinator.pop()
            } label: {
                Text("create team")
            }

        }
    }
}

#Preview {
    AddTeamView()
}
