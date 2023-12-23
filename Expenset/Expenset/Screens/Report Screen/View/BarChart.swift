//
//  BarChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/13/23.
//

import SwiftUI
import Charts

struct BarChart: View {
    
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
                        BarMark(x: .value("Category", summary.category?.name ?? ""), y: .value("Total Amount", summary.totalAmount))
                            .cornerRadius(16)
                            .foregroundStyle(Color.label)
                    }
                }
            } label: {
                Text("Hello").font(.custom(Comfortaa.Bold, size: 24))
            }                
//            .chartForegroundStyleScale(
//                domain: data.map  { $0.weekdayString },
//                range: Color.chartColors
//            )
            
        }

    }
}


#Preview {
    BarChart()
}
