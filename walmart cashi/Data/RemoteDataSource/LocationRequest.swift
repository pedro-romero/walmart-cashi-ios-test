//
//  LocationRequest.swift
//  walmart cashi
//
//  Created by Pedro Romero on 02/10/24.
//

enum LocationRequest: ApiRequest {
    case getLocations
    
    var host: String {
        "https://dummyjson.com"
    }
    
    var path: String {
        switch self {
        case .getLocations: "/c/f929-f8d9-48b6-bfbb"
        }
    }
    
    var method: HTTPRequestMethod {
        .get
    }
    
    var parameters: [String : Any]? { nil }
    var headers: [String : String]? { nil }
}
