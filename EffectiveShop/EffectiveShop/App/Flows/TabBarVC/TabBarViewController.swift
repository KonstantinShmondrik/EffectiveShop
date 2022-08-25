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
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = AppColor.DarkBlue
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        
        tabBar.itemPositioning = .centered
    
        tabBar.layer.cornerRadius = 30
        tabBar.clipsToBounds = true
        
        
        let mainVC = MainViewController()
        
        let tabBarItemMain = UITabBarItem(title: nil,
                                                   image: UIImage(systemName: "app"),
                                          selectedImage: UIImage(systemName: "app.fill"))
        
        mainVC.tabBarItem = tabBarItemMain
        
        
        let cartVC = MyCartViewController()
        
        let tabBarItemcart = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "bag"),
                                              selectedImage: UIImage(systemName: "bag.fill"))
        
        cartVC.tabBarItem = tabBarItemcart
        
        let favoritVC = FavoritsViewController()
        
        let tabBarItemFavorit = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "heart"),
                                              selectedImage: UIImage(systemName: "heart.fill"))
        
        favoritVC.tabBarItem = tabBarItemFavorit
        
        
        let userVC = UserViewController()
        
        let tabBarItemUser = UITabBarItem(title: nil,
                                              image: UIImage(systemName: "person"),
                                              selectedImage: UIImage(systemName: "person.fill"))
        
        userVC.tabBarItem = tabBarItemUser
       
        self.viewControllers = [mainVC, cartVC, favoritVC, userVC]
      

        
     
        
    }
}
