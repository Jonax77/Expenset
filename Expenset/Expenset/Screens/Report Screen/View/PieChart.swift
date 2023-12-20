//
//  PieChart.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/14/23.
//

import SwiftUI
import Charts

struct PieChart: View {
    
    @State private var data: [totalByCategory] = [
        .init(name: "Grocery", value: 1000),
        .init(name: "Rent", value: 3000),
        .init(name: "Shopping", value: 2000),
        .init(name: "Travel", value: 1500)
    ]
    
    var body: some View {
            Chart(data) { total in
                SectorMark(
                    angle: .value(
                        Text(verbatim: total.name),
                        total.value
                    ),
                    innerRadius: .ratio(0.4),
                    angularInset: 8
                )
                .foregroundStyle(
                    by: .value(
                        Text(verbatim: total.name),
                        total.name
                    )
                )
            }
        }
}

#Preview {
    PieChart()
}
