////
////  NewCardView.swift
////  KursovaOOPV2.0
////
////  Created by Макс Лахман on 29.02.2024.
////
//
import SwiftUI

struct CreateCardView: View {
    
    //Свойства вью
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator : HomeCoordinator
    
    
    //Card свойства
    @State private var color = Color.red
    @State private var name = ""
    @State private var coins = ""
    @State private var showEmptyFieldsWarning = false

    var body: some View {
        VStack {
            VStack {
                Form {
                    TextField("Номер рахунку*", text: $name)
                    TextField("Зараування*", text: $coins)
                    ColorPicker("Set the genre color", selection: $color, supportsOpacity: false)
                }

                if showEmptyFieldsWarning {
                    Text("Будь-ласка заповніть всі поля")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }

                Button {
                    if !name.isEmpty && !coins.isEmpty {
                        let newCard = Card(color: color.toHexString()!, name: name, coins: coins)
                        context.insert(newCard)
                        coordinator.pop()
                    } else {
                        // Show warning if fields are empty
                        showEmptyFieldsWarning = true
                    }
                } label: {
                    if name.isEmpty || coins.isEmpty {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray)
                            Text("Створити рахунок")
                                .foregroundColor(.secondary)
                        }.padding(.horizontal)
                        .frame(minHeight: 50, maxHeight: 70)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("MainRedMainColor"))
                            Text("Створити рахунок")
                                .foregroundColor(.secondary)
                        }.padding(.horizontal)
                        .frame(minHeight: 50, maxHeight: 70)
                    }

                }
                .padding(.bottom, 100)
            }
            .navigationTitle("New 💳")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        coordinator.pop()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.gray).frame(maxWidth: 50)

                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16, alignment: .center)
                                .padding(14)
                                .foregroundStyle(Color("MainBackgroundIconColor"))
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    CreateCardView()
        .modelContainer(for: Card.self)
}

