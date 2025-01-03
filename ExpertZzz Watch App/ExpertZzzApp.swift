//
//  ExpertZzzApp.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI

@main
struct ExpertZzz_Watch_AppApp: App {
    @StateObject var ourActionManager = OurActionManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(ourActionManager)
        }
    }
}
