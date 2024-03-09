//
//  SplashScreen.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 29.02.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isSwiped = false
    @State private var circleOffset: CGFloat = 0.0
    @State private var vStackHeight: CGFloat = 100
    var body: some View {
        if isSwiped {
            withAnimation {
                TabBarView()
            }
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("DarkRedMainColor"), Color("MainRedMainColor"), Color("LightRedMainColor"), Color("LightRedMainColor")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Save your\n time & Less\n Expense")
                        .font(.system(size: 50, weight: .semibold, design: .serif))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Text("Best payment method,\n connects your money to\n your friends")
                        .font(.system(size: 19, weight: .medium, design: .serif))
                        .foregroundColor(Color("LightRedMainColor"))
                        .multilineTextAlignment(.center)
                        
                    ZStack {
                        Image("person")
                            .resizable()
                            .scaledToFill()
                            .overlay {
                                VStack {
                                    Spacer()
                                    Text("Swipe up to Start")
                                        .font(.system(size: 19, weight: .medium, design: .serif))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(20)
                                        
                                    VStack(spacing: 0) {
                                        Image(systemName: "control")
                                        Image(systemName: "control")
                                    }
                                    .opacity(Double(1 - abs(circleOffset) / 50))
                                    .padding(15)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                withAnimation {
                                                    circleOffset = gesture.translation.height
                                                }
                                            }
                                            .onEnded { gesture in
                                                withAnimation(.bouncy) {
                                                    if circleOffset < -50 {
                                                        isSwiped = true
                                                        circleOffset = 0
                                                        
                                                    } else {
                                                        // Reset the animation
                                                        isSwiped = false
                                                        circleOffset = 0
                                                    }
                                                }
                                            }
                                    )
                                    .foregroundColor(.white)
                                    .background(

                                        VStack(spacing: 0) {
                                            
                                            ZStack {
                                                Color("MainRedMainColor")
                                                    .opacity(Double(1 - abs(circleOffset) / 50))
                                                VStack {
                                                    Color("MainRedMainColor").clipShape(CustomShape()).rotationEffect(.init(degrees: 180))
                                                }
                                                .opacity(Double(1 - abs(circleOffset) / 50))
                                            }
                                        }
                                        .animation(.easeInOut(duration: 0.5))
                                        
                                    )
                                }
                                .offset(y: circleOffset)
                                .edgesIgnoringSafeArea(.bottom)
                        }
                    }
                    
                }
            }
            
        }
    }
}





#Preview {
    SplashScreen()
}



