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
    let basket: [Basket]
    let delivery, id: String?
    let total: Int?
}

// MARK: - Basket
struct Basket: Codable {
    let id: Int?
    let images: String?
    let price: Int?
    let title: String?
}
