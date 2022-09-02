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
    
    
    var productDitailResult: ProductDitailResult = ProductDitailResult(cpu: "",
                                                                       camera: "", capacity: [],
                                                                       color: [],
                                                                       id: "",
                                                                       images: [],
                                                                       isFavorites: false,
                                                                       price: 0,
                                                                       rating: 0.0,
                                                                       sd: "",
                                                                       ssd: "",
                                                                       title: "")
    
    // MARK: - Initialisers
    
    init() {
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
        getProductDitail()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.backgraund
        setNavigationBar()
        productDetailsView.configurate(productDitailResult: productDitailResult)
        
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
    
    private func getProductDitail() {
        
        let productDitails = requestFactory.makeProductDetailsRequestFactory()
        productDitails.getProductDetails() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.productDitailResult = result
                DispatchQueue.main.async {
                    self?.viewDidLoad()
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Actions
    @objc func toCartTapped (sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 1
    }
    
}

extension ProductDetailsViewController: ProductDetailsViewProtocol {
    func buyButtonTapped() {
        let item = AppBasketItem(productId: Int(productDitailResult.id ?? ""),
                                 productName: productDitailResult.title,
                                 price: productDitailResult.price,
                                 picUrl: productDitailResult.images.first)
        
        AppBasket.shared.items.append(item)
        self.tabBarController?.viewDidLoad()
    }
    
    
    
}


