//
//  MovieService.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation


class MovieService {

    private let netwrokService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol){
        self.netwrokService = service
    }

    func fetchUpComingMovies(page: Int) async throws -> UpComingModel {
        let data = try await netwrokService.request(urlString: .upComingMovies(page), method: .get, type: UpComingModel.self)
        return data
    }
}
