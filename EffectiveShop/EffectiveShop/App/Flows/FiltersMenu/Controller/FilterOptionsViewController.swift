//
//  FilterOptionsViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 29.08.2022.
//

import UIKit

class FilterOptionsViewController: UIViewController {
    // MARK: - Properties
    

    private var filterOptionsView: FilterOptionsView {
        return self.view as! FilterOptionsView
    }
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = FilterOptionsView()
        self.filterOptionsView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = FilterOptionsView()
        view.layer.cornerRadius = 24
        self.filterOptionsView.delegate = self
        
    }
}

extension FilterOptionsViewController: FilterOptionsProtocol {
    func tapDoneTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func tapCloseTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
