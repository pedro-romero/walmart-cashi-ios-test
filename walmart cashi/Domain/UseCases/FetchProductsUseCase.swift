//
//  FetchProductsUseCase.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

protocol FetchProductsUseCaseType {
    func execute() async throws -> [Product]
}

final class FetchProductsUseCase: FetchProductsUseCaseType {
    private let remoteRepository: ProductsRepositoryType
    
    init(remoteRepository: ProductsRepositoryType) {
        self.remoteRepository = remoteRepository
    }
    
    func execute() async throws -> [Product] {
        return try await remoteRepository.fetchProducts()
    }
}
