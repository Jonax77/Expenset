//
//  LineChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/20/23.
//

import SwiftUI
import Charts
import FirebaseAuth
import FirebaseFirestore

struct WeeklySummaryLineChart: View {
    
    @StateObject var viewmodel: WeeklyLineChartViewModel = WeeklyLineChartViewModel()

    
    var body: some View {
        VStack {
            GroupBox {
                Chart {
                    ForEach(viewmodel.expenseData) { summary in
                        LineMark(x:.value("Week Day", summary.dateString), y: .value("Total Amount", summary.totalAmount))
                            .accessibilityLabel(summary.dateString)
                            .accessibilityValue("$\(summary.totalAmount)").interpolationMethod(.catmullRom)
                            .interpolationMethod(.cardinal)
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
                Text("Expense Weekly Report").font(.custom(Comfortaa.Bold, size: 24))
            }
        }.onAppear {

        }
    }
}

#Preview {
    WeeklySummaryLineChart().environmentObject(WeeklyLineChartViewModel())
}
