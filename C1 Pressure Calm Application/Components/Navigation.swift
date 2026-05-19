//
//  navbar.swift
//  C1 App Revisi
//
//  Created by Jeany Aurellia on 13/05/26.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        TabView {
            NavigationStack(){
                HomeView()
                    .ignoresSafeArea()
                    .background(Color.bg)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack{
                ProfileView()
                    .background(Color.bg)
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .tint(Color.darkGreen)
    }
}

#Preview {
    Navigation()
}
