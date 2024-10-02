//
//  LocationDTO.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

struct LocationsDTO: Decodable {
    let result: [LocationDTO]
}

struct LocationDTO: Decodable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}

extension LocationDTO {
    func toDomain() -> Location {
        return .init(id: id, name: name, latitude: latitude, longitude: longitude)
    }
}
