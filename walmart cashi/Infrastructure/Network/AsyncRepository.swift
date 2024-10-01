//
//  AsyncRepository.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import Foundation

final class AsyncRepository: AsyncRepositoryType {
    func request<Response: Decodable>(apiRequest: ApiRequest) async throws -> Response {
        guard let url = URL(string: apiRequest.host + apiRequest.path) else {
            throw NetworkError.invalidRequest
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.method.rawValue
        request.allHTTPHeaderFields = apiRequest.headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw
            NetworkError.responseUnsuccessful
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response
        case 400...499:
            throw NetworkError.notFound
        case 500...599:
            throw NetworkError.badRequest
        default:
            throw NetworkError.undefined
        }
    }
}
