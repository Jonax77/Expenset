//
//  PieChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/14/23.
//

import SwiftUI
import Charts

struct MonthlyExpensePieChart: View {
    @State private var selectedAmount: Double? = nil
    @StateObject var viewmodel: MonthlyPieChartViewModel = MonthlyPieChartViewModel()

    var cumulativeAmount: [(category: String, range: Range<Double>)]?

    var selectedSummary: MonthlyCategoryResult? {
            if let selectedAmount,
               let selectedIndex = cumulativeAmount?
                    .firstIndex(where: { $0.range.contains(selectedAmount) }) {
                return viewmodel.data[selectedIndex]
            }
            return nil
        }
    
    init() {
        var cumulative = 0.0
        cumulativeAmount = viewmodel.data.map {
            let newCumulative = cumulative + Double($0.totalAmount)
            let result = (category: $0.name, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }

    }
    
    
    var body: some View {
        GroupBox {
            Chart(viewmodel.data) { summary in
                SectorMark(
                    angle: .value(
                        Text(verbatim: summary.name),
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
                        summary.name
                    )
                )
                .opacity(self.selectedSummary?.id == summary.id ? 1.0 : 0.9)
            }.chartLegend(position: .bottom, alignment: .center)
                .chartForegroundStyleScale(
                    domain: viewmodel.data.map  { $0.name },
                    range: Color.chartColors
                )
                .chartAngleSelection(value: $selectedAmount)
                .chartBackground { chartProxy in
                                    GeometryReader { geometry in
                                        let frame = geometry[chartProxy.plotFrame!]
                                        VStack(spacing: 0) {
                                            Text(selectedSummary?.name ?? "")
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
                Text("Monthly Expenses").font(.custom(Comfortaa.Bold, size: 24))
                Spacer()
            }
            
        }
           
    }
}

#Preview {
    MonthlyExpensePieChart()
}
