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
    @StateObject private var actionManager = OurActionManager()
 
    enum Tab {
        case controls, metrics
    }

    var body: some View {
        Group {
            if actionManager.ended {
                SummaryView()
            } else {
                TabView(selection: $selection) {
                    ControlsView().tag(Tab.controls)
                    MetricsView(actionManager: actionManager)
                        .tag(Tab.metrics)
                }
                .navigationBarBackButtonHidden()
            }
        }
        .onChange(of: actionManager.ended) {
            if actionManager.ended {
                print("Session has ended")
            }
        }
    }
}

#Preview {
    SessionPaggingView()
}
