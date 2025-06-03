//
//  NetworkService.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

protocol NetworkServiceProtocol {
    func request<T: Codable>(urlString: Route, method: HTTPMethod,type: T.Type) async throws -> T
}


class NetworkService: NetworkServiceProtocol{
    
    
    func request<T: Codable>(urlString: Route, method: HTTPMethod,type: T.Type) async throws -> T {
        
        let movieURL = Route.BaseURL + urlString.description
        guard let url = URL(string: movieURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let (data , response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw APIError.requestFailed(description: "Inavild Response")
        }
        
        guard  response.statusCode == 200 else {
            throw APIError.responseUnsuccessful(description: "StatusCode: \(response.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
            
        } catch {
            throw APIError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
