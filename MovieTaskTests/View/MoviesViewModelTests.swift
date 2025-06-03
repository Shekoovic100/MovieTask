//
//  MovieTaskTests.swift
//  MovieTaskTests
//
//  Created by sherif on 02/06/2025.
//

import XCTest
@testable import MovieTask
@MainActor
final class MoviesViewModelTests: XCTestCase {

    var sut: ViewModel!
    var mockUseCase: MockFetchMoviesUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchMoviesUseCase()
        sut = ViewModel(getMoviesUseCase: mockUseCase)
    }

    override func tearDown() {
        sut = nil
        mockUseCase = nil
        super.tearDown()
    }

    func testFetchUpComingMoviesSuccess() async {
       
        // Given
        let movies = (1...10).map { UpComingResults(id: $0, overview: " overview \($0)", posterPath: String($0), title: "Desc") }
        mockUseCase.moviesToReturn = movies
        mockUseCase.mockTotalPages = 62
        let expectation = XCTestExpectation(description: "Fetch movies succeeds")
        
        // Act
        await sut.fetchUpComingMovies()
        
        // Assert
        XCTAssertTrue(mockUseCase.executeUpcomingMovieCalled, "executeUpcomingMovie should be called")
        XCTAssertEqual(sut.upComingList.count, 10, "upComingList should contain 2 movies")
        XCTAssertEqual(sut.upComingList, movies, "upComingList should match mock movies")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 1.0)
    }


}
