//
//  GradientBorderButton.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit

class GradientBorderButton: UIButton {
    var gradientColors: [UIColor] = [.gradientStart, .gradientEnd] {
        didSet {
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let gradient = UIImage.gradientImage(bounds: bounds, colors: gradientColors)
        layer.borderColor = UIColor(patternImage: gradient).cgColor
        layer.borderWidth = 3
    }
}
