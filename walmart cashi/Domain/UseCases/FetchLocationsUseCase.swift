//
//  FetchLocationsUseCase.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

protocol FetchLocationsUseCaseType {
    func execute() async throws -> [Location]
}

final class FetchLocationsUseCase: FetchLocationsUseCaseType {
    private let remoteRepository: LocationsRepositoryType
    
    init(remoteRepository: LocationsRepositoryType) {
        self.remoteRepository = remoteRepository
    }
    
    func execute() async throws -> [Location] {
        return try await remoteRepository.fetchLocations().map { $0.toDomain() }
    }
}

