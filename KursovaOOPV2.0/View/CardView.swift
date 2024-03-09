//
//  EditCardView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

struct CardView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Bindable var card : Card
    @Query private var teams: [TeamModel]
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10){
                
                AdditionalFuncionalityCard(card: card)
                    
                
                if teams.isEmpty {
                    Button {
                        coordinator.push(.addTeamView)
                    } label: {
                        ZStack{
                            Capsule()
                                .strokeBorder(Color(card.hexColor), style: .init(lineWidth: 2.2, dash: [4.5]))
                            HStack {
                                Text("Додай команду")
                                Image(systemName: "plus.circle.fill")
                                    .scaleEffect(1.4)
                            }
                            .foregroundStyle(Color(card.hexColor))
                        }
                        .frame(maxHeight: 70)
                        .padding(.horizontal, 20)
                    }
                } else {
                    HorisontalSVAllTeams(card: card, teams: teams).padding(.horizontal, 20)
                }
                
                TransactionListView()
                    
                
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop()
                }, label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16, alignment: .center)
                            .padding(14)
                            .foregroundStyle(Color("MainBackgroundIconColor"))
                    }
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                ButtonDeleteCard(card: card)
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        CardView(card: Card(color: "MainRedMainColor", name: "32763765256776", coins: "32667"))
    }
    
}


struct HorisontalSVAllTeams: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Bindable var card : Card
    var teams : [TeamModel]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(){
                Button(action: {
                    coordinator.push(.addTeamView)
                }, label: {
                    ZStack {
                        Capsule()
                            .strokeBorder(Color(card.hexColor), style: .init(lineWidth: 2.2, dash: [4.5]))
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16, alignment: .center)
                            .padding(30)
                            .foregroundStyle(Color(card.hexColor))
                    }
                })
                ForEach(teams, id: \.self) { team in
                    VStack {
                        Button {
                            coordinator.selectedTeam = team
                            coordinator.push(.teamView)
                        } label: {
                            ZStack {
                                UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 20)
                                    .fill(card.hexColor.opacity(0.8))
                                VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        HStack{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color(card.hexColor))
                                                    .frame(maxWidth: 50, maxHeight: 50)
                                                Image(systemName: randomIcon())
                                                    .imageScale(.small)
                                            }
                                            .padding(.vertical, 10)
      
                                        }
                                        Text(team.teamName)
                                    }
                                    .padding(.horizontal, 10)
                                    
                                    Button(action: {
                                        print("Click on Button")
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color(card.hexColor))
                                            Text("Оплатити")
                                        }
                                        .padding(.vertical, 10)
                                    })
                                    .padding(10)
                                    .buttonStyle(.borderless)
                                }
                                
                                .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                
                            }
                            .frame(minWidth: 190)
                            
                            
                        }
                    }
                }
            }
            .frame(maxHeight: 180)
        }
        //                    ScrollView(.horizontal, showsIndicators: false){
        //                        HStack(){
        //                            ForEach(teams, id: \.self) { team in
        //                                VStack {
        //                                    Button {
        //                                        coordinator.selectedTeam = team
        //                                        coordinator.push(.teamView)
        //                                    } label: {
        //                                        ZStack {
        //                                            Capsule()
        //                                                .fill(card.hexColor)
        //                                            Text(team.teamName)
        //                                                .foregroundStyle(Color("MainTextAndForegroundIconColor"))
        //                                                .padding(.horizontal, 20)
        //                                        }
        //                                        .frame(maxHeight: 70)
        //
        //                                    }
        //                                }
        //                            }
        //                        }
        //                        .padding(.vertical, 20)
        //                    }
    }
    
    
    func randomIcon() -> String {
        let arrImages = ["person.3", "person.2", "person.3.fill", "person.3.sequence", "person.3.sequence.fill", "figure.2"]
        let image = arrImages.randomElement() ?? "person.3"
        return image
    }
}

#Preview {
    HorisontalSVAllTeams(card: Card(color: "MainRedMainColor", name: "32763765256776", coins: "32667"), teams: [TeamModel(teamName: "Developers"), TeamModel(teamName: "Designers")])
}



struct AdditionalFuncionalityCard: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Bindable var card : Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(card.hexColor)
            
            VStack(alignment: .trailing, spacing: 0) {
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 0){
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("$\(card.coins)")
                                .font(.system(size: 32, weight: .medium, design: .serif))
                            Text(".00")
                                .font(.system(size: 22, weight: .medium, design: .serif))
                                .padding(.bottom, 3)
                        }
                    }
                    Spacer()
                }
                .padding(20)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("MainBackgroundIconColor"))
                        .padding(.bottom, 20)
                        .padding(.horizontal, 20)
                    HStack(alignment: .center){
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Income")
                            Text("+34.210.00")
                        }
                        Spacer()
                        Divider()
                            .padding(.vertical, 20)
                            .background(Color(card.hexColor))
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Spendings")
                            Text("-24.343.00")
                        }
                        Spacer()
                    }
                    .padding(.vertical, 20)
                }
                .frame(maxHeight: UIScreen.main.bounds.height / 7)
            }
            
        }
        .navigationTitle(card.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
        .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 4)
    }
}

#Preview {
    NavigationStack{
        AdditionalFuncionalityCard(card: Card(color: "MainRedMainColor", name: "max", coins: "2121"))
    }
}


struct ButtonDeleteCard: View {
    @EnvironmentObject private var coordinator : HomeCoordinator
    @Bindable var card : Card
    var body: some View {
        Button {
            coordinator.push(.deleteCardView)
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(.gray)
                    Image(systemName: "scale.3d")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16, alignment: .center)
                        .padding(14)
                        .foregroundStyle(Color("MainBackgroundIconColor"))
                        
                    
                }
            }
            .foregroundColor(.secondary)
        }
    }
}



struct TransactionListView: View {
    var body: some View {
        List() {
            Section("Transaction") {
                ForEach(1...10, id: \.self) { i in
                    Text("\(i)")
                        .font(.footnote)
                }
            }
            .padding(5)
            .font(.title)
            
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .padding(.bottom, 70)
    }
}

