//
//  ContentView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    var body: some View {
        NavigationLink (
            "Start shift",
            destination: Text("Starting shift")
        ).padding()
    }
}

#Preview {
    ContentView()
}
