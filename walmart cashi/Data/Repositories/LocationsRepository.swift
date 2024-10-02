//
//  LocationsRepository.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

final class LocationsRepository: LocationsRepositoryType {
    private let locationsRemoteDataSorce: LocationsRemoteDataSource
    
    init(locationsRemoteDataSorce: LocationsRemoteDataSource) {
        self.locationsRemoteDataSorce = locationsRemoteDataSorce
    }
    
    func fetchLocations() async throws -> [LocationDTO] {
        return try await locationsRemoteDataSorce.fetchLocations().result
    }
}
