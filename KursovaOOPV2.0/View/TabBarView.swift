//
//  TabBarView.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

enum Tabs {
    case home
    case settings
}



import SwiftUI

struct TabBarView: View {

    @State private var rotationAngle: Double = 0.0
    @State private var animate = false
    @State private var currentTab : Tabs = .home
    @State private var isSettingsTabActive = false
    var body: some View {
        ZStack{
            TabView(selection: $currentTab){
                Group{
                    HomeCoordinatorView()
                        .tag(Tabs.home)
                        
                    SettingsCoordinatorView()
                        .tag(Tabs.settings)
                        
                }
                .toolbar(.hidden, for: .tabBar)
            }
            
            .tint(.red)
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar : some View {
        
        HStack{
            Spacer()
            Button{
                withAnimation(.easeInOut) {
                    animate.toggle()
                    currentTab = .home
                    withAnimation(.easeInOut(duration: 0.8)) {
                        rotationAngle = 360
                    }
                }

            } label: {
                VStack {
                    Image(systemName: "house.lodge.fill").resizable().scaledToFit().frame(width: 42)
                        .symbolEffect(.bounce.up.byLayer, value: animate)
                    if currentTab == .home {
                        Text("Home").font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(currentTab == .home ? Color.primary : Color.secondary)
            Spacer()
            Button {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isSettingsTabActive.toggle()
//                    settingsCoordinator.popToRoot()

                    if currentTab == .settings && isSettingsTabActive {
                        rotationAngle = 0
                    } else {
                        rotationAngle = 180
                    }
                    
                    withAnimation {
                        currentTab = .settings
                    }
                }
            } label: {
                VStack {
                    Image(systemName: "gearshape").resizable().scaledToFit().frame(width: 22)
                        .rotationEffect(.degrees(rotationAngle))
                    if currentTab == .settings {
                        Text("Setting").font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(currentTab == .settings ? Color.primary : Color.secondary)
            Spacer()
            
        }
        .frame(height: 72)
        .background{
            RoundedRectangle(cornerRadius: 35)
                .fill(RadialGradient(gradient: Gradient(colors: [Color("MainRedMainColor"), .white]), center: .center, startRadius: 30, endRadius: 350))
                .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
        }
        .padding(.horizontal, 10)
    }
}




#Preview {
    TabBarView()
    
}
