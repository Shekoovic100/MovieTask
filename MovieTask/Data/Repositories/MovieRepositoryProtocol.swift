//
//  MovieRepositoryProtocol.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getupComingMovies(page: Int) async throws -> UpComingModel
}

class MovieRepository: MovieRepositoryProtocol {
    
    private let movieService: MovieService
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }

    func getupComingMovies(page: Int) async throws -> UpComingModel {
        return try await movieService.fetchUpComingMovies(page: page)
    }
    
    
}
