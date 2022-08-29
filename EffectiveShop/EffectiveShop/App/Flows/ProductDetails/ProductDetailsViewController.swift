//
//  ProductDetailsViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let requestFactory = RequestFactory()
    
    var mainResult: MainResult = MainResult(homeStore: [], bestSeller: [])
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductDitail()
        
        
    }
    
    // MARK: - Privat func
    
    private func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.darkBlue
    }
    
    private func getProductDitail() {
        
        let productDitails = requestFactory.makeProductDetailsRequestFactory()
        productDitails.getProductDetails() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.productDitailResult = result
                DispatchQueue.main.async {
                    self?.loadView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    
    // MARK: - Actions
    @objc func filterTapped (sender: UIBarButtonItem) {
        
    }
    
}




