//
//  UpdateHeaderView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 04.03.2024.
//

import SwiftUI


struct UpdateHeaderView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        VStack {
            TextField("Імʼя", text: $userViewModel.user.userName)
        }
        .navigationBarBackButtonHidden()

        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    coordinator.pop()
                } label: {
                    Text("<")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    coordinator.pop()
                } label: {
                    Text("update")
                }
            }
        }
        
    }
}






        


