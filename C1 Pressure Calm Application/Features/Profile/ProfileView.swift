//
//  ProfileView.swift
//  C1 App Revisi
//
//  Created by Jeany Aurellia on 05/05/26.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var vibrateOnRing = true
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){

                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 60)

                ZStack{
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.darkGreen)

                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.lightGreen)
                }

                Text("User 1")
                    .font(.title)
                    .bold()

                NavigationLink{
                    ProfileDetail()
                } label: {
                    Text("Edit foto")
                }

                List{
                    Section{
                        NavigationLink{
                            ProfileDetail()
                        } label: {
                            Label("Manage Profil", systemImage: "gearshape")
                        }

                        NavigationLink{
                            PersonalisasiDetail()
                        } label: {
                            Label("Personalisasi", systemImage: "slider.horizontal.3")
                        }

                        NavigationLink{

                        } label: {
                            Label("Manage Notification", systemImage: "bell")
                        }
                    }
                    .listRowBackground(Color.leafGreen)
                }
                .scrollContentBackground(.hidden)
            }
        }
        
    }
    
}

#Preview {
    ProfileView()
}
