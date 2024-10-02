//
//  MapListInteractor.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class MapListInteractor {
    private let fetchLocationsUseCase: FetchLocationsUseCaseType
    
    init(fetchLocationsUseCase: FetchLocationsUseCaseType) {
        self.fetchLocationsUseCase = fetchLocationsUseCase
    }
}

extension MapListInteractor: MapListInteractorType {
    func fetchLocations() async throws -> [Location] {
        return try await fetchLocationsUseCase.execute()
    }
}
