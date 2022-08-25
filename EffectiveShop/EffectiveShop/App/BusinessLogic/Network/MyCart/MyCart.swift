//
//  MyCart.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation
import Alamofire

class MyCart: AbstractRequestFactory {
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

extension MyCart: MyCartRequestFactory {
    func getMyCart(completionHandler: @escaping (AFDataResponse<CartResult>) -> Void) {
        let requestModel = GetMyCart(baseURL: baseUrl)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}


extension MyCart {
    struct GetMyCart: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .get
        let path: String = "v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        
        var parameters: Parameters? {
            return [:]
        }
    }
}
