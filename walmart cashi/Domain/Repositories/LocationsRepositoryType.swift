//
//  LocationsRepositoryType.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

protocol LocationsRepositoryType {
    func fetchLocations() async throws -> [LocationDTO]
}
