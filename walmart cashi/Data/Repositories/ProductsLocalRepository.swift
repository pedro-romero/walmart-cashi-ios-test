//
//  ProductsLocalRepository.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class ProductsLocalRepository: ProductsLocalRepositoryType {
    private let productsLocalDataSorce: ProductsLocalDataSource
    
    init(productsLocalDataSorce: ProductsLocalDataSource) {
        self.productsLocalDataSorce = productsLocalDataSorce
    }
    
    func fetchProducts() async throws -> [ProductDTO] {
        return try await productsLocalDataSorce.fetchProducts()
    }
    
    func save(_ products: [ProductDTO]) async throws {
        try await productsLocalDataSorce.save(products)
    }
}
