//
//  ProductDetailsRequestFactory.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation
import Alamofire

protocol ProductDetailsRequestFactory {
    func getProductDetails(completionHandler: @escaping (AFDataResponse<ProductDitailResult>) -> Void)
}
