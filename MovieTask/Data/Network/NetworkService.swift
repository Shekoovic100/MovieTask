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
    
    private let cache = URLCache()
    
    
    init() {
            let config = URLSessionConfiguration.default
            config.urlCache = cache
            config.requestCachePolicy = .returnCacheDataElseLoad
        }
    
    
    func request<T: Codable>(urlString: Route, method: HTTPMethod,type: T.Type) async throws -> T {
        
        let movieURL = Route.BaseURL + urlString.description
        guard let url = URL(string: movieURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let cachedResponse = cache.cachedResponse(for: request),
           let movies = try? JSONDecoder().decode(T.self, from: cachedResponse.data) {
            print("Loaded movies from cache")
            return movies
        }
        
        let (data , response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw APIError.requestFailed(description: "Inavild Response")
        }
        
        guard  response.statusCode == 200 else {
            throw APIError.responseUnsuccessful(description: "StatusCode: \(response.statusCode)")
        }
        
        do {
            let decodeedData = try JSONDecoder().decode(type, from: data)
            let cachedResponse = CachedURLResponse(response: response , data: data)
            cache.storeCachedResponse(cachedResponse, for: request)
            return decodeedData
            
        } catch {
            throw APIError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
