//
//  ProductsLocalRepositoryType.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

protocol ProductsLocalRepositoryType {
    func fetchProducts() async throws -> [ProductDTO]
    func save(_ products: [ProductDTO]) async throws
}
