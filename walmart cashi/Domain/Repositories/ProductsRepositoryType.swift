//
//  ProductsRepositoryType.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

protocol ProductsRepositoryType {
    func fetchProducts() async throws -> [ProductDTO]
}
