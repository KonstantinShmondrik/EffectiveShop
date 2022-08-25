//
//  MainRequest.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - MainRequest
struct MainResult: Codable {
    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

// MARK: - BestSeller
struct BestSeller: Codable {
    let id: Int
    let isFavorites: Bool?
    let title: String?
    let priceWithoutDiscount: Int?
    let discountPrice: Int?
    let picture: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture
    }
}

// MARK: - HomeStore
struct HomeStore: Codable {
    let id: Int
    let isNew: Bool?
    let title, subtitle: String?
    let picture: String?
    let isBuy: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title, subtitle, picture
        case isBuy = "is_buy"
    }
}
