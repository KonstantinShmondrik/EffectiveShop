//
//  ProductDetailsView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 30.08.2022.
//

import UIKit
import SnapKit

class ProductDetailsView: UIView {
    
    // MARK: - Outlets
    private(set) lazy var hederProductDetailsView: HederProductDetailsView = {
        let view = HederProductDetailsView()
        //        view.pictures = productDitailResult.images
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var footerProductDetailsView: FooterProductDetailsView = {
        let view = FooterProductDetailsView()
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    
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
    
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        
        self.addSubviews([hederProductDetailsView, footerProductDetailsView])
        
        hederProductDetailsView.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.leading.trailing.equalTo(self).offset(0)
            $0.height.equalTo(280)
            //            $0.bottom.equalTo(self).offset(0)
        }
        
        footerProductDetailsView.snp.makeConstraints {
            $0.top.equalTo(hederProductDetailsView.snp.bottom).offset(0)
            $0.leading.trailing.equalTo(self).offset(0)
            $0.bottom.equalTo(self.snp.bottom).offset(0)
        }
    }
}

// MARK: - Configure
extension ProductDetailsView {
    func configurate(productDitailResult: ProductDitailResult) {
        self.productDitailResult = productDitailResult
        self.hederProductDetailsView.configurate(pictures: productDitailResult.images )
        self.footerProductDetailsView.configurate(data: .init(cpu: productDitailResult.cpu ?? "",
                                                              camera: productDitailResult.camera ?? "",
                                                              capacity: productDitailResult.capacity ,
                                                              color: productDitailResult.color ,
                                                              id: productDitailResult.id ?? "",
                                                              isFavorites: productDitailResult.isFavorites ?? false,
                                                              price: productDitailResult.price ?? 0,
                                                              rating: productDitailResult.rating ?? 0.0,
                                                              sd: productDitailResult.sd ?? "",
                                                              ssd: productDitailResult.ssd ?? "",
                                                              title: productDitailResult.title ?? ""))
        
    }
}

