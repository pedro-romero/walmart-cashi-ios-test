//
//  ProductsLocalDataSource.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class ProductsLocalDataSource {
    private let coreDataLocalStorage: CoreDataLocalStorage
    
    init(coreDataLocalStorage: CoreDataLocalStorage = CoreDataLocalStorage.shared) {
        self.coreDataLocalStorage = coreDataLocalStorage
    }
}

extension ProductsLocalDataSource: ProductsLocalRepositoryType {
    func fetchProducts() async throws -> [ProductDTO] {
        try await coreDataLocalStorage.fetch(request: ProductCD.fetchRequest()).map { $0.toDTO() }
    }
    
    func save(_ products: [ProductDTO]) async throws {
        try await coreDataLocalStorage.save(products)
    }
}
