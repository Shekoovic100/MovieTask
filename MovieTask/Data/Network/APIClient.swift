//
//  APIClient.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

final class APIClient: NetworkingManagerProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
     self.init(configuration: .default)
    }
    
}
