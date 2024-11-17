//
//  SessionPaggingView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI

struct SessionPaggingView: View {
    @State private var selection: Tab = .metrics
    
    enum Tab {
        case constrols, metrics
    }

    var body: some View {
        TabView(selection: $selection) {
            Text("Controls").tag(Tab.constrols)
            Text("Metrics").tag(Tab.metrics)
        }
    }
}

#Preview {
    SessionPaggingView()
}
