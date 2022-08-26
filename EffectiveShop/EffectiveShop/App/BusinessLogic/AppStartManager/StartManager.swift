//
//  StartManager.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

final class StartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = TabBarViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
    
}
