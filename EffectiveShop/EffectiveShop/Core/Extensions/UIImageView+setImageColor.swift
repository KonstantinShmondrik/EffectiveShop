//
//  UIImageView+setImageColor.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 27.08.2022.
//

import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
