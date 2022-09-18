//
//  TabBarViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        self.delegate = self
        
        UITabBar.appearance().barTintColor = AppColor.darkBlue
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = AppColor.darkBlue
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 10, vertical: 10)
       
        
        tabBar.itemPositioning = .fill
    
        tabBar.layer.cornerRadius = 30
        tabBar.clipsToBounds = true
        
        
        let mainVC = UINavigationController(rootViewController: MainScreenViewController(viewModel: MainScreenViewModel()))
        
        let tabBarItemMain = UITabBarItem(title: nil,
                                          image: UIImage(systemName: "app")?.withRenderingMode(UIImage.RenderingMode.automatic),
                                          selectedImage: UIImage(systemName: "app.fill")?.withRenderingMode(UIImage.RenderingMode.automatic))
        
        mainVC.tabBarItem = tabBarItemMain
        configuredNavigationController(navVC: mainVC)
        
        
        let cartVC = UINavigationController(rootViewController: MyCartViewController())
        
        let tabBarItemCart = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "bag")?.withRenderingMode(UIImage.RenderingMode.automatic),
                                              selectedImage: UIImage(systemName: "bag.fill")?.withRenderingMode(UIImage.RenderingMode.automatic))
        
        
        
        cartVC.tabBarItem = tabBarItemCart
        configuredNavigationController(navVC: cartVC)
        
        let favoritVC = UINavigationController(rootViewController: FavoritsViewController())
        
        let tabBarItemFavorit = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "heart")?.withRenderingMode(UIImage.RenderingMode.automatic),
                                              selectedImage: UIImage(systemName: "heart.fill")?.withRenderingMode(UIImage.RenderingMode.automatic))
        
        favoritVC.tabBarItem = tabBarItemFavorit
        configuredNavigationController(navVC: favoritVC)
        
        
        let userVC = UINavigationController(rootViewController: UserViewController())
        
        let tabBarItemUser = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "person")?.withRenderingMode(UIImage.RenderingMode.automatic),
                                              selectedImage: UIImage(systemName: "person.fill")?.withRenderingMode(UIImage.RenderingMode.automatic))
        
        userVC.tabBarItem = tabBarItemUser
        configuredNavigationController(navVC: userVC)
       
        self.viewControllers = [mainVC, cartVC, favoritVC, userVC]
        
        setBadgeValue(barItem: tabBarItemCart, valu: AppBasket.shared.items.count)
    
    }
    
    private func configuredNavigationController (navVC: UINavigationController) {
        navVC.navigationBar.barTintColor = AppColor.backgraund
        navVC.navigationBar.backgroundColor = AppColor.backgraund
        navVC.navigationBar.isTranslucent = true
        navVC.navigationBar.prefersLargeTitles = true
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    private func setBadgeValue(barItem: UITabBarItem, valu: Int ) {
        if valu != 0 {
        barItem.badgeValue = String(valu)
        }
    }
    
    
}
