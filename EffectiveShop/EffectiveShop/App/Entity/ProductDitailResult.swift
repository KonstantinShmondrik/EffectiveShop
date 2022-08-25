//
//  ProductDitailResult.swift
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
struct ProductDitailResult: Codable {
    let cpu, camera: String?
    let capacity, color: [String]?
    let id: String
    let images: [String]?
    let isFavorites: Bool?
    let price: Int
    let rating: Double?
    let sd, ssd, title: String?

    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
}
