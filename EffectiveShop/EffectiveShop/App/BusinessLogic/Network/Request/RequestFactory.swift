//
//  RequestFactory.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    // MARK: - Main
    func makeMainRequestFactory() -> MainRequestFactory {
        let errorParser = makeErrorParser()
        return Main(errorParser: errorParser,
                    sessinManager: commonSession,
                    queue: sessionQueue)
    }
    
    // MARK: - ProductDetails
    func makeProductDetailsRequestFactory() -> ProductDetailsRequestFactory {
        let errorParser = makeErrorParser()
        return ProductDetails(errorParser: errorParser,
                    sessinManager: commonSession,
                    queue: sessionQueue)
    }
    
    // MARK: - MyCart
    func makeMyCartRequestFactory() -> MyCartRequestFactory {
        let errorParser = makeErrorParser()
        return MyCart(errorParser: errorParser,
                    sessinManager: commonSession,
                    queue: sessionQueue)
    }
}
