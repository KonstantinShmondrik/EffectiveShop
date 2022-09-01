//
//  CartResult.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CartResult: Codable {
    var basket: [Basket]
    var delivery, id: String?
    var total: Int?
}

// MARK: - Basket
struct Basket: Codable {
    var id: Int?
    var images: String?
    var price: Int?
    var title: String?
    var count: Int?
    var total: Int?
    
    init(id: Int, images: String, price: Int, title: String, count: Int, total: Int) {
        self.id = id
        self.images = images
        self.price = price
        self.title = title
        self.count = count
        self.total = price * count
    }
}
