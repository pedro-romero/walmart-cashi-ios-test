//
//  ProductsRemoteDataSource.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class ProductsRemoteDataSource {
    
    private let apiClient: AsyncRepositoryType
    
    init(apiClient: AsyncRepository = AsyncRepository()) {
        
        self.apiClient = apiClient
    }
    
    func fetchProducts() async throws -> ProductsDTO {
        return try await apiClient.request(apiRequest: ProductsRequest.getProducts)
    }
}
