//
//  MetricsView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI

struct MetricsView: View {
    @ObservedObject var actionManager = OurActionManager()

    var body: some View {
        VStack {
            ElapsedTimeView(
                elapsedTime: actionManager.elapsedTime,
                showSubseconds: false
            )
                .foregroundStyle(Color.yellow)
                .commonTextStyle(.title2)
            if let heartRate = actionManager.currentHeartRate {
                Text("\(Int(heartRate)) bpm")
                    .commonTextStyle(.title)
            }
        }
        .scenePadding()
        .onAppear {
            actionManager.startHeartRateQuery()
        }
    }
}

extension View {
    func commonTextStyle(_ style: Font.TextStyle) -> some View {
        self.font(
            .system(style, design: .rounded)
                .monospaced()
                .lowercaseSmallCaps()
        )
    }
}

#Preview {
    MetricsView(actionManager: OurActionManager())
}
