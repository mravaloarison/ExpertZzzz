//
//  ContentView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject var ourActionManager = OurActionManager()
    @State private var showSheet = false
    
    var body: some View {
        List {
            NavigationLink (
                "Start shift",
                destination: SessionPaggingView()
            )
            .padding()
        }
        .onAppear() {
            ourActionManager.requestAuthorization()
        }
        .sheet(isPresented: $showSheet, content: {
            SummaryView()
        })
        .onChange(of: ourActionManager.ended) { bf, ended in
            if ended {
                showSheet = true
            }
        }
    }
}

#Preview {
    ContentView()
}
