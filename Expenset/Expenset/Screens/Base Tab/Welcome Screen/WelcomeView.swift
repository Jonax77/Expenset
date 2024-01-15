//
//  WelcomeView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/23/23.
//

import UIKit

class WelcomeView: UIView {
    
    var titleLabel: UILabel!
    var welcomeBg: UIImageView!
    var nextButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemBackground
        
        setupView()
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupTitleLabel()
        setupBg()
        setupNextButton()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            nextButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 100),
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            
            welcomeBg.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            welcomeBg.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            welcomeBg.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Expenset"
        titleLabel.font = UIFont(name: Comfortaa.Bold, size: 48)
        titleLabel.textColor = UIColor.label
        titleLabel.translatesAutoresizingMaskIntoConstraints  = false
        self.addSubview(titleLabel)
    }
    
    func setupBg() {
        welcomeBg = UIImageView(image: UIImage(named: "welcome")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal))
        welcomeBg.contentMode = .scaleAspectFit
        welcomeBg.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(welcomeBg)
    }
    
    func setupNextButton() {
        nextButton = UIButton(type: .system)        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let icon = UIImage(systemName: "arrow.right", withConfiguration: iconConfiguration)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        nextButton.setImage(icon, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(nextButton)

    }

}

#Preview {
    WelcomeViewController()
}
