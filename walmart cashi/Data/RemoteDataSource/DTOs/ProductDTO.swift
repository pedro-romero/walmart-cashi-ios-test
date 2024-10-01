//
//  ProductDTO.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

struct ProductsDTO: Decodable {
    let products: [ProductDTO]
}

struct ProductDTO: Decodable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
}

extension ProductDTO {
    func toDomain() -> Product {
        return .init(id: id, name: title, price: price)
    }
}
