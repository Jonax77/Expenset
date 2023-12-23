//
//  ReportView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import SwiftUI

class ReportView: UIView {
    
    var containerView: UIScrollView!
    var barChartVC: UIHostingController<BarChart>!
    var pieChartVC: UIHostingController<PieChart>!
    var lineChartVC: UIHostingController<LineChart>!
    
    var timeRangeControl: UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupContainerView()
//        setupBarChart()
        setupPieChart()
        setupTimeRangeControl()
        setupLineChart()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            pieChartVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            pieChartVC.view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pieChartVC.view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pieChartVC.view.heightAnchor.constraint(equalToConstant: 500),
            
            timeRangeControl.topAnchor.constraint(equalTo: pieChartVC.view.bottomAnchor, constant: 32),
            timeRangeControl.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeRangeControl.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            timeRangeControl.heightAnchor.constraint(equalToConstant: 32),
            
            lineChartVC.view.topAnchor.constraint(equalTo: timeRangeControl.bottomAnchor, constant: 32),
            lineChartVC.view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lineChartVC.view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            lineChartVC.view.heightAnchor.constraint(equalToConstant: 300),
            lineChartVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupTimeRangeControl() {
        let action1 = UIAction(title: "Option 1", handler: { _ in print("Option 1 selected") })
        let action2 = UIAction(title: "Option 2", handler: { _ in print("Option 2 selected") })
        let action3 = UIAction(title: "Option 3", handler: { _ in print("Option 2 selected") })
        let action4 = UIAction(title: "Option 4", handler: { _ in print("Option 2 selected") })
        timeRangeControl = UISegmentedControl(frame: .zero, actions: [action1, action2, action3, action4])
        timeRangeControl.setTitleTextAttributes([.font: UIFont(name: Comfortaa.Bold, size: 12) as Any, .foregroundColor: UIColor.label], for: .normal)
        timeRangeControl.setTitleTextAttributes([.font: UIFont(name: Comfortaa.Bold, size: 12) as Any, .foregroundColor: UIColor.systemBackground], for: .selected)
        timeRangeControl.selectedSegmentTintColor = UIColor.label
        timeRangeControl.selectedSegmentIndex = 0
        timeRangeControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(timeRangeControl)
    }
    
    func setupContainerView() {
        containerView = UIScrollView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
    }
    
    func setupLineChart() {
        lineChartVC = UIHostingController(rootView: LineChart())
        lineChartVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lineChartVC.view)
    }
    
    func setupBarChart() {
        barChartVC = UIHostingController(rootView: BarChart())
        barChartVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(barChartVC.view)
    }
    
    func setupPieChart() {
        pieChartVC = UIHostingController(rootView: PieChart())
        pieChartVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pieChartVC.view)
    }

}

#Preview {
    ReportViewController()
}
