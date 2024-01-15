//
//  BarChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/13/23.
//

import SwiftUI
import Charts

struct TopFiveCategoryBarChart: View {
    
    @StateObject var viewmodel: TopFiveBarChartViewModel = TopFiveBarChartViewModel()
    @Binding var type: String

    
    var body: some View {
        VStack {
            GroupBox {
                Chart {
                    ForEach(type == "Expense" ? viewmodel.expenseData : viewmodel.incomeData) { summary in
                        BarMark(x: .value("Category", summary.name), y: .value("Total Amount", summary.totalAmount))
                            .cornerRadius(16)                .foregroundStyle(
                                by: .value(
                                    "Name",
                                    summary.name
                                )
                            )
                    }
                }
            } label: {
                Text("Top Five Category").font(.custom(Comfortaa.Bold, size: 24))
            }
            .chartForegroundStyleScale(
                domain: (type == "Expense" ? viewmodel.expenseData : viewmodel.incomeData).map  { $0.name },
                range: Color.chartColors.reversed()
            )
            
        }

    }
}


#Preview {
    TopFiveCategoryBarChart(type: .constant("Expense"))
}
