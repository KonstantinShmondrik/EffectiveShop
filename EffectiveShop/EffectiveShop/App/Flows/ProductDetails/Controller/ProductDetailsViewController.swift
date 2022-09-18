//
//  ProductDetailsViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var productDetailsView: ProductDetailsView {
        return self.view as! ProductDetailsView
    }
    private let requestFactory = RequestFactory()
    private let viewModel: ProductDetailsViewModel
    
    // MARK: - Initialisers
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let view = ProductDetailsView()
        //        view.delegate = self
        self.view = view
        view.delegate = self
        tabBarController?.tabBar.isHidden = true
        self.viewModel.getProductDitail(viewController: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.backgraund
        setNavigationBar()
        productDetailsView.configurate(productDitailResult: self.viewModel.productDitailResult)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isTranslucent = true
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    // MARK: - Privat func
    
    private func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .done, target: self, action: #selector(toCartTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.orange
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Product Details"
        navigationController?.navigationBar.prefersLargeTitles = false
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(filterTapped))
        //        navigationItem.leftBarButtonItem?.tintColor = AppColor.darkBlue
        
        //        navigationController?.text = "Product Details"
    }
    
    
    // MARK: - Actions
    @objc func toCartTapped (sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 1
    }
    
}

extension ProductDetailsViewController: ProductDetailsViewProtocol {
    func buyButtonTapped() {
        let item = AppBasketItem(productId: Int(self.viewModel.productDitailResult.id ?? ""),
                                 productName: self.viewModel.productDitailResult.title,
                                 price: self.viewModel.productDitailResult.price,
                                 picUrl: self.viewModel.productDitailResult.images.first)
        
        AppBasket.shared.items.append(item)
        self.tabBarController?.viewDidLoad()
    }
}


