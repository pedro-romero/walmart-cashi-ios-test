//
//  ProductsRequest.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

enum ProductsRequest: ApiRequest {
    case getProducts
    
    var host: String {
        "https://dummyjson.com"
    }
    
    var path: String {
        switch self {
        case .getProducts: "/products/category/smartphones"
        }
    }
    
    var method: HTTPRequestMethod {
        .get
    }
    
    var parameters: [String : Any]? { nil }
    var headers: [String : String]? { nil }
}
