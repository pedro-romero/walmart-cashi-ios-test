//
//  ProductsListInteractor.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class ProductsListInteractor {
    private let fetchProductsUseCase: FetchProductsUseCaseType
    
    init(fetchProductsUseCase: FetchProductsUseCaseType) {
        self.fetchProductsUseCase = fetchProductsUseCase
    }
}

extension ProductsListInteractor: ProductsListInteractorType {
    func fetchProducts() async throws -> [Product] {
        return try await fetchProductsUseCase.execute()
    }
}
