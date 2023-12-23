//
//  LineChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/20/23.
//

import SwiftUI
import Charts

struct LineChart: View {
//    ((summary.category != nil) ? summary.category?.name : summary.category?.type)
    @State private var data: [TransactionSummary] = [
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 991000)), endDate: Date(), type: .expense, category: Category(name: "Grocery", type: .expense), totalAmount: 1000),
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 551000)), endDate: Date(), type: .expense, category: Category(name: "Shopping", type: .expense), totalAmount: 5000),
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 1000)), endDate: Date(), type: .expense, category: Category(name: "Rent", type: .expense), totalAmount: 2000),
    ]
    
    var body: some View {
        VStack {
            GroupBox {
                Chart {
                    ForEach(data) { summary in
                        LineMark(x:.value("Week Day", summary.shortDay), y: .value("Total Amount", summary.totalAmount))
                            .accessibilityLabel(summary.weekdayString)
                            .accessibilityValue("$\(summary.totalAmount)").interpolationMethod(.catmullRom)
                            .foregroundStyle(Color.label)
                            .lineStyle(StrokeStyle(lineWidth: 3, dash: [5, 10]))
                            .symbol() {
                                                        Rectangle()
                                    .fill(Color.label)
                                                            .frame(width: 8, height: 8)
                                                    }
                                                    .symbolSize(30)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                 } .chartLegend(position: .trailing, alignment: .center, spacing: 10)
                
            } label:  {
                Text("Hihi").font(.custom(Comfortaa.Bold, size: 24))
            }
        }
    }
}

#Preview {
    LineChart()
}
