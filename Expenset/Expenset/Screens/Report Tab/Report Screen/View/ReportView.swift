//
//  NewReportView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ReportView: View {
    @State var selectedType: String = "Expense"
    let types = ["Expense", "Income"]
    
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                MonthlyExpensePieChart().frame(height: 400)
                Picker("", selection: $selectedType) {
                    ForEach(types, id: \.self) { type in
                        Text(type).font(.custom(Comfortaa.Regular, size: 16))
                    }
                }.pickerStyle(.segmented)
                TopFiveCategoryBarChart(type: $selectedType).frame(height: 300)
                    
            }
        }.padding()
        
    }
}

#Preview {
    ReportView()
}
