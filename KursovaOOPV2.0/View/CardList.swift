//
//  CardList.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI
import SwiftData

struct CardList: View {
    @Environment(\.modelContext) private var context
    @Query private var cards: [Card]
    private var spacing: CGFloat = -70
    private var rotation: CGFloat = UIScreen.main.bounds.width / 6.5
    private var enableReflection = true
    @EnvironmentObject private var coordinator : HomeCoordinator
    var body: some View {
        VStack {
            if cards.isEmpty {
                ContentUnavailableView {
                    Button {
                        coordinator.push(.createCardView)
                    } label: {
                        VStack{
                            Image(systemName: "creditcard.fill")
                                .font(.largeTitle)
                            Text("Додати картку")
                                .font(.title)
                                .bold()
                        }
                        .foregroundColor(.secondary)
                    }
                }
            } else {
                CoverFlowView(itemWidth: 280, enableReflection: enableReflection, spacing: spacing, rotation: rotation, items: cards) { card in
                    Button {
                        coordinator.selectedCard = card
                        coordinator.push(.editCardView)
                    } label: {
                        MoneyPanelView(card: card)
                    }
                }
                .frame(maxHeight: 180)
                .padding(.vertical, 20)
                ActivitiesView()
                Spacer(minLength: 0)
            }
        }
    }
}






struct MoneyPanelView: View {
    @Bindable var card : Card
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(card.hexColor))
            VStack(alignment: .leading) {
                Text(card.name).font(.title2)
                Text(card.coins).foregroundStyle(.secondary)
            }
            .foregroundColor(Color("MainTextAndForegroundIconColor"))
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.4, height: 150)
    }
}






struct ActivitiesView: View {
    let arrImages : [String] = ["1", "2", "3", "4", "3dPerson"]
    var body: some View {
        VStack {
            HStack(){
                Text("Activites")
                Spacer()
            }.padding(.leading, 25).font(.system(size: 20, weight: .semibold, design: .serif)).foregroundColor(Color("MainTextAndForegroundIconColor"))
            HStack(spacing: 8){
                VStack{
                    lastActivities(arrUsers: arrImages)
                    
                    HStack(spacing: 5){
                        defaultSystemIntergationCompanies(image: "payoneer", nameCorporation: "Payoneer")
                        defaultSystemIntergationCompanies(image: "paypal", nameCorporation: "PayPal")
                    }
                }
                NavigationLink {
                } label: {
                    payrollCalculation()
                }

            }
            .frame(maxHeight: 250)
            .padding(.horizontal, 10)
        }
    }
    
    func lastActivities(arrUsers : [String]) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Send Again")
                        .font(.system(size: 15, weight: .semibold, design: .rounded)).padding(.bottom, 10)
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                    Spacer()
                }
                
                HStack(spacing: -10) {
                    if arrUsers.count > 4 {
                        ForEach(arrUsers.prefix(3), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                        Text("+\(arrUsers.count - 3)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        ForEach(arrUsers.prefix(4), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                    }
                }
            }.padding(.leading, 15)
        }
    }
    
    func defaultSystemIntergationCompanies(image : String, nameCorporation : String) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 60)
                Text(nameCorporation)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
            }
        }
    }
    
    func payrollCalculation() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(systemName: "banknote.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .frame(maxWidth: 60)
                    .padding(25)
                    .background(Color("FirstBackgroundColor"))
                    .clipShape(Circle())
                
                    
                Text("Розрахуємо заробітну плату?")
                    .multilineTextAlignment(.center)
            }
        }
        .foregroundColor(Color("MainTextAndForegroundIconColor"))
    }
    
}

#Preview {
    NavigationStack{
        CardList().modelContainer(for: Card.self)
    }
    
}



//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(cards) { card in
//                                NavigationLink {
//                                    EditCardView(/*book: book*/)
//                                } label: {
//                                    HStack(spacing: 10) {
//                                        //                                card.icon
//                                        ZStack{
//                                            RoundedRectangle(cornerRadius: 20)
//                                                .fill(Color(card.hexColor))
//                                            VStack(alignment: .leading) {
//                                                Text(card.name).font(.title2)
//                                                Text(card.coins).foregroundStyle(.secondary)
//                                                //                                    if let rating = book.rating {
//                                                //                                        HStack {
//                                                //                                            ForEach(1..<rating, id: \.self) { _ in
//                                                //                                                Image(systemName: "star.fill")
//                                                //                                                    .imageScale(.small)
//                                                //                                                    .foregroundStyle(.yellow)
//                                                //                                            }
//                                                //                                        }
//                                                //                                    }
//                                                //                                    if let genres = book.genres {
//                                                //                                        ViewThatFits {
//                                                //                                            GenresStackView(genres: genres)
//                                                //                                            ScrollView(.horizontal, showsIndicators: false) {
//                                                //                                                GenresStackView(genres: genres)
//                                                //                                            }
//                                                //                                        }
//                                                //                                    }
//                                            }
//                                        }
//                                    }
//                                }
//
//                            }
//                            .onDelete { indexSet in
//                                indexSet.forEach { index in
//                                    let card = cards[index]
//                                    context.delete(card)
//                                }
//                            }
//                        }
//                    }
