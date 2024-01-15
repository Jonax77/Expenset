//
//  CircularViews.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/24/23.
//

import Foundation
import UIKit

class CircularImageView: UIImageView {
    override var image: UIImage? {
        didSet {
            guard let image = image else { return }
            applyCircularMask(image: image)
        }
    }

    private func applyCircularMask(image: UIImage) {
        layer.cornerRadius = bounds.height / 2 // Set corner radius to half of the height
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
    }
}

class CircularButton: UIButton {
    private var circularImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularImageView()
    }

    private func setupCircularImageView() {
        circularImageView.contentMode = .scaleAspectFill
        circularImageView.clipsToBounds = true
        addSubview(circularImageView)
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circularImageView.topAnchor.constraint(equalTo: topAnchor),
            circularImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circularImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circularImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        guard let image = image else { return }
        circularImageView.image = image
        circularImageView.layer.cornerRadius = bounds.height / 2 // Set corner radius to half of the height
    }
}
