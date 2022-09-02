//
//  ProductDetails.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation
import Alamofire

class ProductDetails: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    let baseUrl = URL(string: "https://run.mocky.io/")!
    
    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension ProductDetails: ProductDetailsRequestFactory {
    func getProductDetails(completionHandler: @escaping (AFDataResponse<ProductDitailResult>) -> Void) {
        let requestModel = GetProductDetails(baseURL: baseUrl)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}


extension ProductDetails {
    struct GetProductDetails: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .get
        let path: String = "v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        
        var parameters: Parameters? {
            return [:]
        }
    }
}

