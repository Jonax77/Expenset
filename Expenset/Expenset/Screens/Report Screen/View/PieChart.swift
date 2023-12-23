//
//  PieChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/14/23.
//

import SwiftUI
import Charts

struct PieChart: View {
    @State private var selectedAmount: Double? = nil
    
    let cumulativeAmount: [(category: String, range: Range<Double>)]

    var selectedSummary: TransactionSummary? {
            if let selectedAmount,
               let selectedIndex = cumulativeAmount
                .firstIndex(where: { $0.range.contains(selectedAmount) }) {
                return data[selectedIndex]
            }
            return nil
        }
    
    private let data: [TransactionSummary] = [
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 1000)), endDate: Date(), type: .expense, category: Category(name: "Grocery", type: .expense), totalAmount: 1000),
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 1000)), endDate: Date(), type: .expense, category: Category(name: "Shopping", type: .expense), totalAmount: 5000),
        .init(startDate: Date(timeIntervalSinceNow: TimeInterval(integerLiteral: 1000)), endDate: Date(), type: .expense, category: Category(name: "Rent", type: .expense), totalAmount: 2000),
    ]
    
    init() {
        var cumulative = 0.0
        self.cumulativeAmount = data.map {
            let newCumulative = cumulative + Double($0.totalAmount)
            let result = (category: $0.category!.name, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }
    }

    
    var body: some View {
        GroupBox {
            Chart(data) { summary in
                SectorMark(
                    angle: .value(
                        Text(verbatim: summary.category?.name ?? ""),
                        summary.totalAmount
                    ),
                    innerRadius: .ratio(self.selectedSummary?.id == summary.id ? 0.5 : 0.6),
                    outerRadius: .ratio(self.selectedSummary?.id == summary.id ? 1.0 : 0.9),
                    angularInset: 8
                )
                .cornerRadius(8)
                .foregroundStyle(
                    by: .value(
                        "Category",
                        summary.category?.name ?? summary.type.stringValue
                    )
                )
                .opacity(self.selectedSummary?.id == summary.id ? 1.0 : 0.9)
            }.chartLegend(position: .bottom, alignment: .center)
                .chartForegroundStyleScale(
                    domain: data.map  { $0.category?.name ?? $0.type.stringValue },
                    range: Color.chartColors
                )
                .chartAngleSelection(value: $selectedAmount)
                .chartBackground { chartProxy in
                                    GeometryReader { geometry in
                                        let frame = geometry[chartProxy.plotFrame!]
                                        VStack(spacing: 0) {
                                            Text(selectedSummary?.category?.name ?? "")
                                                .multilineTextAlignment(.center)
                                                .font(.custom(Comfortaa.Regular, size: 20))
                                                .frame(width: 120, height: 80)
                                            Text("$\(selectedSummary?.totalAmount ?? 0, specifier: "%.0f")")
                                                .font(.custom(Comfortaa.Bold, size: 28))
                                                .foregroundColor((selectedSummary != nil) ? .primary : .clear)
                                        }
                                        .position(x: frame.midX, y: frame.midY)
                                    }
                                }

        } label: {
            HStack {
                Spacer()
                Text("Hello").font(.custom(Comfortaa.Bold, size: 24))
                Spacer()
            }
            
        }
           
    }
}

#Preview {
    PieChart()
}
