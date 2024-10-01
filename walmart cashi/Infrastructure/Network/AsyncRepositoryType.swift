//
//  AsyncRepositoryType.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

protocol AsyncRepositoryType: AnyObject {
    
    func request<Response: Decodable>(apiRequest: ApiRequest) async throws -> Response
}
