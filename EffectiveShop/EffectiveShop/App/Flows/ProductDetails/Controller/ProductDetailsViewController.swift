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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        let view = ProductDetailsView()
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartButton"), style: .done, target: self, action: #selector(toCartTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .done, target: self, action: #selector(toBack))
        navigationItem.title = "Product Details"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Actions
    @objc func toCartTapped (sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(MyCartViewController(viewModel: MyCartViewModel()), animated: true)
    }
    
    @objc func toBack() {
        self.navigationController?.popViewController(animated: true)
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


