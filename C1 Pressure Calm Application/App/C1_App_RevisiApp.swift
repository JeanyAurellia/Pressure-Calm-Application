//
//  C1_App_RevisiApp.swift
//  C1 App Revisi
//
//  Created by Jeany Aurellia on 01/05/26.
//

import SwiftUI
import SwiftData

@main
struct C1_App_RevisiApp: App {
    var body: some Scene {
        WindowGroup {
//            HomeView()
////                .ignoresSafeArea()
//                .background(Color.bg)
            Navigation()
                .ignoresSafeArea()
                .background(Color.bg)
        }
    }
}
