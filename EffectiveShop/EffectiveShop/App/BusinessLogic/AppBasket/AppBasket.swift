//
//  AppBasket.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 02.09.2022.
//


import Foundation

class AppBasket {
    static let shared = AppBasket()
    init(){}
    
    var items: [AppBasketItem] = []
}

struct AppBasketItem {
    let productId: Int?
    let productName: String?
    let price: Int?
    let picUrl: String?
}
