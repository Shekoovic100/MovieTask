//
//  GetMoviesUseCase.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

protocol GetMoviesUseCaseProtocol {
    func excuteUpcomingMovie(page: Int) async throws -> UpComingModel
}


class GetMoviesUseCase: GetMoviesUseCaseProtocol {

    private let repository: MovieRepositoryProtocol

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    
    func excuteUpcomingMovie(page: Int) async throws -> UpComingModel {
        try await repository.getupComingMovies(page: page)
    }
    
}
