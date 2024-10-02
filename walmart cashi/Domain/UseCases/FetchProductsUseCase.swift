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
    private let localRepository: ProductsLocalRepositoryType
    
    init(remoteRepository: ProductsRepositoryType, localRepository: ProductsLocalRepositoryType) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func execute() async throws -> [Product] {
        let localProducts = try await localRepository.fetchProducts()
        
        if !localProducts.isEmpty {
            return localProducts.map { $0.toDomain() }
        }
        
        let remoteProducts = try await remoteRepository.fetchProducts()
        try await localRepository.save(remoteProducts)
        return remoteProducts.map { $0.toDomain() }
    }
}
