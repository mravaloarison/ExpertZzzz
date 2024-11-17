//
//  SummaryView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI
import HealthKit

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
        Text(value)
            .font(.system(.title2, design: .rounded)
                    .lowercaseSmallCaps()
            )
            .foregroundColor(.accentColor)
        Divider()
    }
}

struct SummaryView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var actionManager = OurActionManager()
    
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                SummaryMetricView(
                    title: "Total working time",
                    value:  "00:31"
                )
                .accentColor(Color.yellow)

                // Display Total Break Time
                SummaryMetricView(
                    title: "Total break time",
                    value: "00:15"
                )
                .accentColor(Color.green)

                Button("Done") {
                    dismiss()
                }
            }
            .scenePadding()
        }
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SummaryView(actionManager: OurActionManager())
}
