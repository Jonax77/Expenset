//
//  HomeView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class HomeView: UIView {
    
    var balanceLabel: UILabel!
    var balanceAmountLabel: UILabel!
    
    var incomeBg: UIView!
    var incomeIconBg: UIView!
    var incomeIcon: UIImageView!
    var incomeLabel: UILabel!
    var incomeAmountLabel: UILabel!
    
    var expenseBg: UIView!
    var expenseIconBg: UIView!
    var expenseIcon: UIImageView!
    var expenseLabel: UILabel!
    var expenseAmountLabel: UILabel!
    
    var timeRangeControl: UISegmentedControl!
    var transactionTable: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupBalanceLabel()
        setupBalanceAmountLabel()
        
        setupIncomeBg()
        setupIncomeIconBg()
        setupIncomeIcon()
        setupIncomeLabel()
        setupIncomeAmountLabel()
        
        setupTimeRangeControl()
        setupTransactionTable()
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            balanceLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            balanceAmountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 16),
            balanceAmountLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            incomeBg.topAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor, constant: 24),
            incomeBg.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            incomeBg.widthAnchor.constraint(equalToConstant: 160),
            incomeBg.heightAnchor.constraint(equalToConstant: 80),
            
            incomeIconBg.topAnchor.constraint(equalTo: incomeBg.topAnchor, constant: 16),
            incomeIconBg.leadingAnchor.constraint(equalTo: incomeBg.leadingAnchor, constant: 16),
            incomeIconBg.widthAnchor.constraint(equalToConstant: 48),
            incomeIconBg.heightAnchor.constraint(equalToConstant: 48),
            
            incomeIcon.topAnchor.constraint(equalTo: incomeIconBg.topAnchor, constant: 8),
            incomeIcon.leadingAnchor.constraint(equalTo: incomeIconBg.leadingAnchor, constant: 8),
            incomeIcon.widthAnchor.constraint(equalToConstant: 32),
            incomeIcon.heightAnchor.constraint(equalToConstant: 32),
            
            incomeLabel.topAnchor.constraint(equalTo: incomeIconBg.topAnchor),
            incomeLabel.leadingAnchor.constraint(equalTo: incomeIconBg.trailingAnchor, constant: 8),
            
            incomeAmountLabel.topAnchor.constraint(equalTo: incomeLabel.bottomAnchor, constant: 8),
            incomeAmountLabel.leadingAnchor.constraint(equalTo: incomeLabel.leadingAnchor),
            
            timeRangeControl.topAnchor.constraint(equalTo: incomeBg.bottomAnchor, constant: 32),
            timeRangeControl.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeRangeControl.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            timeRangeControl.heightAnchor.constraint(equalToConstant: 32),
            
            transactionTable.topAnchor.constraint(equalTo: timeRangeControl.bottomAnchor, constant: 16),
            transactionTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            transactionTable.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transactionTable.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
        ])
    }
    
    func setupTransactionTable() {
        transactionTable = UITableView()
        transactionTable.register(SimpleTransactionTableViewCell.self, forCellReuseIdentifier: Config.simpleTransactionTableCellID)
        transactionTable.separatorStyle = .none
        transactionTable.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(transactionTable)
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
        self.addSubview(timeRangeControl)
    }
    
    func setupIncomeAmountLabel() {
        incomeAmountLabel = UILabel()
        incomeAmountLabel.text = "$ 15000"
        incomeAmountLabel.font = UIFont(name: Comfortaa.Bold, size: 20)
        incomeAmountLabel.textColor = UIColor.label
        incomeAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeBg.addSubview(incomeAmountLabel)
    }
    
    func setupIncomeLabel() {
        incomeLabel = UILabel()
        incomeLabel.text = "Income"
        incomeLabel.font = UIFont(name: Comfortaa.SemiBold, size: 16)
        incomeLabel.textColor = UIColor.label
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeBg.addSubview(incomeLabel)
    }
    
    func setupIncomeIcon() {
        incomeIcon = UIImageView(image: UIImage(systemName: "square.and.arrow.down.fill"))
        incomeIcon.tintColor = UIColor.systemFill
        incomeIcon.translatesAutoresizingMaskIntoConstraints = false
        incomeBg.addSubview(incomeIcon)
    }
    
    func setupIncomeIconBg() {
        incomeIconBg = UIView()
        incomeIconBg.layer.cornerRadius = 12
        incomeIconBg.backgroundColor = UIColor.systemBackground
        incomeIconBg.translatesAutoresizingMaskIntoConstraints = false
        incomeBg.addSubview(incomeIconBg)
    }
    
    func setupIncomeBg() {
        incomeBg = UIView()
        incomeBg.layer.cornerRadius = 16
        incomeBg.backgroundColor = UIColor.systemFill
        incomeBg.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(incomeBg)
    }
    
    func setupBalanceAmountLabel() {
        balanceAmountLabel = UILabel()
        balanceAmountLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        balanceAmountLabel.text = "$ 9600"
        balanceAmountLabel.textColor = UIColor.label
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(balanceAmountLabel)
    }
    
    func setupBalanceLabel() {
        balanceLabel = UILabel()
        balanceLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        balanceLabel.text = "Current Balance"
        balanceLabel.textColor = UIColor.secondaryLabel
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(balanceLabel)
    }

}

#Preview {
    HomeViewController()
}
