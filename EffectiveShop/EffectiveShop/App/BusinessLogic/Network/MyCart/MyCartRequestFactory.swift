//
//  MyCartRequestFactory.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation

import Foundation
import Alamofire

protocol MyCartRequestFactory {
    func getMyCart(completionHandler: @escaping (AFDataResponse<CartResult>) -> Void)
}
