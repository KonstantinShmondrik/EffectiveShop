//
//  ProductDetailsViewModel.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 18.09.2022.
//

import UIKit

final class ProductDetailsViewModel {
    
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
    
    private let requestFactory = RequestFactory()
    
   func getProductDitail(viewController: UIViewController) {
        
        let productDitails = requestFactory.makeProductDetailsRequestFactory()
        productDitails.getProductDetails() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.productDitailResult = result
                DispatchQueue.main.async {
                    viewController.viewDidLoad()
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
