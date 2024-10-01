//
//  ApiRequest.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

protocol ApiRequest {
    var host: String { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
