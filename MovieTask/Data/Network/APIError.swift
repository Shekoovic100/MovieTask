//
//  APIError.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

enum APIError: Error {
    
    case requestFailed(description: String)
    case responseUnsuccessful(description: String)
    case invalidData
    case failedSerialization
    case jsonConversionFailure(description: String)
    case invalidURL
    
    var customeDescription: String {
        
        switch self {
        case .requestFailed(let description):
            return "request Failed\(description)"
        case .invalidData:
            return "inavild Data"
        case .failedSerialization:
            return "JSON Pasing failure"
        case .responseUnsuccessful(description: let description):
            return "Unsuccessful: \(description)"
        case .jsonConversionFailure(description: let description):
            return "JSON Conversion Failure: \(description)"
        case .invalidURL:
            return "invalidURL"
        }
    }
}
