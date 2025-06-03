//
//  MockFetchMoviesUseCase.swift
//  MovieTaskTests
//
//  Created by sherif on 03/06/2025.
//

import Foundation

@testable import MovieTask

class MockFetchMoviesUseCase: GetMoviesUseCaseProtocol {
 
    
    var moviesToReturn: [UpComingResults] = []
    var shouldReturnError = false
    var mockTotalPages = 62
    var mockTotalResults = 1231
    var executeUpcomingMovieCalled = false
    var capturedPage: Int?

    func excuteUpcomingMovie(page: Int) async throws -> UpComingModel {
        executeUpcomingMovieCalled = true
        capturedPage = page
        
        if shouldReturnError {
            throw NSError(domain: "TestError", code: -1, userInfo: nil)
        }
        
        return UpComingModel(page: page, results: moviesToReturn, totalPages: mockTotalPages, totalResults: mockTotalResults)
    }
}
