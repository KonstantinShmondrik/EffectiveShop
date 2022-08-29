//
//  AppFont.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 26.08.2022.
//

import UIKit

struct AppFont {

    enum MarkProWeight: String {
        case regular = ""
        case medium = "-Medium"
        case bold = "-Bold"
        case heavy = "-Heavy"
    }

    static func markProFont(ofSize size: CGFloat = UIFont.systemFontSize, weight: MarkProWeight = .regular) -> UIFont {
        return UIFont(name: "MarkPro\(weight.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
}
