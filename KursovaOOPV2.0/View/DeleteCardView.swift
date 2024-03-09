//
//  DeleteCardView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 01.03.2024.
//

import SwiftUI

struct DeleteCardView: View {
    @Environment(\.modelContext) private var context
    @State private var confirmDeletingCard = false
    @EnvironmentObject private var coordinator : HomeCoordinator
    var card: Card
    
    
    var body: some View {
        VStack {
            Button(action: {
                confirmDeletingCard.toggle()
            }, label: {
                Text("Delete Card")
            })
            .confirmationDialog("Are you sure?", isPresented: $confirmDeletingCard) {
                Button {
                } label: {
                    Label("Більше інформації", systemImage: "questionmark.circle")
                }
                Button("Видалити картку", role: .destructive) {
                    context.delete(card)
                    coordinator.popToRoot()
                }
            }
            .padding()
        }
    }
}



