//
//  Extensions.swift
//  GoPizza
//
//  Created by Rafael Rocha on 06/01/23.
//

import Foundation
import QuartzCore
import UIKit

extension CAGradientLayer {
    static func linearGradient(topColor: UIColor,
                               bottomColor: UIColor,
                               type: CAGradientLayerType = .axial,
                               bounds: CGRect) -> CALayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = type
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        
        return gradientLayer
    }
}
