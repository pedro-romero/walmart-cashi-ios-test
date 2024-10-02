//
//  LocationsRemoteDataSource.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

final class LocationsRemoteDataSource {
    
    private let apiClient: AsyncRepositoryType
    
    init(apiClient: AsyncRepository = AsyncRepository()) {
        
        self.apiClient = apiClient
    }
    
    func fetchLocations() async throws -> LocationsDTO {
        return try await apiClient.request(apiRequest: LocationRequest.getLocations)
    }
}
