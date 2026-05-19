//
//  ContentView.swift
//  C1 App Revisi
//
//  Created by Jeany Aurellia on 01/05/26.
//

import SwiftUI

struct HomeView : View {
    @State private var showingPopup = false
    @State private var showBreathView = false
    var body: some View {
        
        VStack{
            
            // MARK: NAVBAR
            ZStack{
                HStack{
                    HStack{
                        NavigationLink(destination: ProfileView()){
                            ZStack{
                                Circle()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color.lightGreen)
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .foregroundStyle(Color.leafGreen)
                                    .zIndex(1)
                            }
                            Text("Hi, User")
                                .foregroundStyle(Color.white)
                                .font(Font.system(size: 21, weight: .bold, design: .rounded))
                        }
                        Spacer()
                        Image(systemName: "bell")
                            .font(Font.system(size: 21))
                            .frame(width: 24, height: 25)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)
                .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 140)
            .background(
                Color.darkGreen
                    .padding(.top, -100)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 40,
                            bottomTrailingRadius: 40,
                            topTrailingRadius: 0
                        )
                    )
            )
            .padding(.bottom, 10)
            
            // MARK: STACK BREATH
            ZStack{
                Image("breath")
                    .resizable()
                    .frame(width: 215, height: 230)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: -25, y: 25)
                    .contrast(0.5)
                
                VStack(){
                    Text("Let's Try   ")
                        .font(Font.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.lightGreen)
                        .frame(width:145, alignment: .leading)
                    
                    Text("Breathing")
                        .font(Font.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.white)
                        .frame(width:145, alignment: .leading)
                    NavigationLink (destination: BreathView()){
                        Text("Start")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .frame(width: 145, height: 44)
                            .background(Color.lightGreen)
                            .foregroundStyle(.text)
                            .font(Font.system(size: 20, weight: .bold, design: .rounded))
                            .cornerRadius(20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
                //                .position(x: 70, y: 100)
            }
            .frame(width: 365, height: 190)
            .background(Color.leafGreen)
            .cornerRadius(20)
            
            // MARK: FOR YOU
            VStack{
                Text("For You")
                    .font(Font.system(size: 20, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                //                    .padding(.bottom, 0)
                
                // MARK: METHOD FOR YOU
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        //                        NavigationLink(destination: BreathView()){
                        Button {
                            
                            showingPopup = true
                            
                        } label: {
                            
                            VStack{
                                
                                Image("breath")
                                    .resizable()
                                    .frame(width: 115, height: 117)
                                
                                Text("Breathing")
                                    .foregroundStyle(Color.lightGreen)
                                    .font(
                                        Font.system(
                                            size: 20,
                                            weight: .bold,
                                            design: .rounded
                                        )
                                    )
                            }
                            .frame(width: 147, height: 190)
                            .background(Color.leafGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 19))
                        }
                        .sheet(isPresented: $showingPopup) {
                            VStack{
                                
                                Image("breath")
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                Text("Breathing")
                                    .foregroundStyle(Color.text)
                                    .font(Font.system(size: 24, weight: .bold, design: .rounded))
                                Text("Breath is the process of inhaling oxygen and exhaling carbon dioxide. It is a fundamental life process that sustains all living organisms. It is also the primary source of energy for the human body. Proper breathing is essential for maintaining good health and overall well-being.")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Button {
                                    showingPopup = false
                                    showBreathView = true
                                    
                                } label: {
                                    
                                    Text("Start")
                                        .frame(width: 100, height: 50)
                                        .background(Color.leafGreen)
                                        .foregroundStyle(Color.lightGreen)
                                        .cornerRadius(10)
                                }
                            }
                            .presentationDetents([.medium])
                        }
                        .fullScreenCover(isPresented: $showBreathView) {
                            
                            BreathView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.bg)
                        }
                        //                        }
                        
                        VStack{
                            Image("grounding")
                                .resizable()
                                .frame(width: 115, height: 117)
                            Text("Grounding")
                                .foregroundStyle(Color.text)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 147, height: 190)
                        .background(.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 19))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.border, lineWidth: 2))
                        
                        VStack{
                            Image("journaling")
                                .resizable()
                                .frame(width: 115, height: 117)
                            Text("Journaling")
                                .foregroundStyle(Color.text)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 147, height: 190)
                        .background(.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 19))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.border, lineWidth: 2))
                        
                    }
                    .padding(.vertical, 1)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity)
                }
            }
            
            // MARK: ALL METHOD
            VStack{
                Text("All Method")
                    .font(Font.system(size: 20, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                // MARK: METHOD FOR YOU
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        VStack{
                            Image("breath")
                                .resizable()
                                .frame(width: 115, height: 117)
                            Text("Breathing")
                                .foregroundStyle(Color.text)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 147, height: 190)
                        .background(.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 19))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.border, lineWidth: 2))
                        
                        VStack{
                            Image("breath")
                                .resizable()
                                .frame(width: 115, height: 117)
                            Text("Breathing")
                                .foregroundStyle(Color.text)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 147, height: 190)
                        .background(.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 19))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.border, lineWidth: 2))
                        
                        VStack{
                            Image("breath")
                                .resizable()
                                .frame(width: 115, height: 117)
                            Text("Breathing")
                                .foregroundStyle(Color.text)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 147, height: 190)
                        .background(.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 19))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.border, lineWidth: 2))                    }
                    .padding(.vertical, 1)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment : .top)
    }
}

#Preview {
    
    NavigationStack{
        HomeView()
            .ignoresSafeArea()
            .background(Color.bg)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment : .top)
    }
}
