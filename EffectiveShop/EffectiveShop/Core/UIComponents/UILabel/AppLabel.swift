//
//  AppLabel.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 26.08.2022.
//

import UIKit

final class AppLabel: UILabel {

    // MARK: - Properties
    var title: String?
    var colorText: UIColor?
    var numberLines: Int

    // MARK: - Init
    init(title: String? = "",
         alignment: NSTextAlignment,
         fontSize: UIFont,
         colorText: UIColor? = .black,
         numberLines: Int = 1) {
        self.title = title
        self.colorText = colorText
        self.numberLines = numberLines
        super.init(frame: .zero)
        text = title
        font = fontSize
        textAlignment = alignment
        textColor = colorText
        numberOfLines = numberLines
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

