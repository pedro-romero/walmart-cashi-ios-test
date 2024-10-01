//
//  ProductsRepository.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import Foundation

final class ProductsRepository: ProductsRepositoryType {
    private let productsRemoteDataSorce: ProductsRemoteDataSource
    
    init(productsRemoteDataSorce: ProductsRemoteDataSource) {
        self.productsRemoteDataSorce = productsRemoteDataSorce
    }
    
    func fetchProducts() async throws -> [Product] {
        return try await productsRemoteDataSorce.fetchProducts().products.map { $0.toDomain() }
    }
}
