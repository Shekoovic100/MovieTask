//
//  MovieService.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation


protocol MovieService {
    
    func fetchUpComingMovies(page: Int) async throws -> UpComingModel
}


class MovieServicesImplement: MovieService {

    private let apiClient = APIClient()

    func fetchUpComingMovies(page: Int) async throws -> UpComingModel {
        let data = try await apiClient.request(urlString: .upComingMovies(page), method: .get, type: UpComingModel.self)
        return data
    }
}
