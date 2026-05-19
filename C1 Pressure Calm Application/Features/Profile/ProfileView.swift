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
            VStack{
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                Text("User 1")
                    .font(.title)
                NavigationLink{
                    ProfileDetail()
                } label: {
                    Text("Edit foto")
                }
            }
            
            List{
                Section(header: Text("Account")){
                    NavigationLink{
                        ProfileDetail()
                    } label: {
                        Text("Edit Profil")
                    }
                    
                }
                Section(header: Text("Personalisasi")){
                    NavigationLink{
                        PersonalisasiDetail()
                    } label: {
                        VStack{
                            Text("Personalisasi")
                        }
                    }
                    NavigationLink{
                        
                    } label: {
                        VStack{
                            Text("Take Test")
                        }
                    }
                    
                }
                Section(header: Text("Setting")){
                    Toggle(
                        "Notification",
                        isOn: $vibrateOnRing
                    )
                }
            }
        }
        
    }
    
}

#Preview {
    ProfileView()
}
