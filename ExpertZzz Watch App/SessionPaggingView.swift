//
//  SessionPaggingView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI
import WatchKit

struct SessionPaggingView: View {
    @State private var selection: Tab = .metrics
    
    enum Tab {
        case controls, metrics
    }

    var body: some View {
        TabView(selection: $selection) {
            ControlsView().tag(Tab.controls)
            MetricsView().tag(Tab.metrics)
        }
    }
}

#Preview {
    SessionPaggingView()
}
