//
//  MetricsView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI

struct MetricsView: View {
    var body: some View {
        VStack {
            Text("03:15.23")
                .foregroundStyle(Color.yellow)
                .commonTextStyle(.title2)
            Text(
                153.formatted(
                    .number.precision(.fractionLength(0))
                )
                + " bpm"
            )
            .commonTextStyle(.title)
        }
        .scenePadding()
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
    MetricsView()
}
