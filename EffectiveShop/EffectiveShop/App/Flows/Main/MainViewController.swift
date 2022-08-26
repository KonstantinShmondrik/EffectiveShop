//
//  MainViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()

        
    }
    
    // MARK: - Privat func
    
    private func setNavigationBar() {
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.darkBlue
    }
   
    // MARK: - Actions
    @objc func filterTapped (sender: UIBarButtonItem) {
        print("tap filter")
    }

}
