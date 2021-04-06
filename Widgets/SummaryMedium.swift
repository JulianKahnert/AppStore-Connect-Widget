//
//  SummaryMedium.swift
//  AC Widget
//
//  Created by Cameron Shemilt on 01.04.21.
//

import SwiftUI
import WidgetKit

struct SummaryMedium: View {
    let data: ACData

    var body: some View {
        HStack(spacing: 0) {
            dateSection
            informationSection
                .padding([.vertical, .trailing], 12)
        }
    }

    var dateSection: some View {
        Text(data.latestReportingDate())
            .font(.subheadline)
            .rotationEffect(.degrees(-90))
            .fixedSize()
            .frame(maxWidth: 30, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
    }

    var informationSection: some View {
        HStack(alignment: .top, spacing: 0) {
            Spacer()
            downloadsSection
            Spacer()
            Spacer()
            Spacer()
            proceedsSection
            Spacer()
        }
    }

    var downloadsSection: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            UnitText(data.getDownloadsString(), metricSymbol: "square.and.arrow.down")
            GraphView(data.getDownloads(30))

            VStack(spacing: 0) {
                DescribedValueView(description: "LAST_SEVEN_DAYS", value: data.getDownloadsString(7, size: .compact))
                DescribedValueView(description: "LAST_THIRTY_DAYS", value: data.getDownloadsString(30, size: .compact))
            }
        }
    }

    var proceedsSection: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            UnitText(data.getProceedsString(), metric: data.currency)
            GraphView(data.getProceeds(30))

            VStack(spacing: 0) {
                DescribedValueView(description: "LAST_SEVEN_DAYS", value: data.getProceedsString(7, size: .compact).appending(data.currency))
                DescribedValueView(description: "LAST_THIRTY_DAYS", value: data.getProceedsString(30, size: .compact).appending(data.currency))
            }
        }
    }
}

struct SummaryMedium_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SummaryMedium(data: ACData.example)
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            SummaryMedium(data: ACData.exampleLargeSums)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}