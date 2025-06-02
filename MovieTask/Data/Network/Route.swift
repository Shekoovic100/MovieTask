//
//  Route.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

enum Route {
    
    static let BaseURL = "https://api.themoviedb.org/3/"
    private var getAPIKey: String {
         let apiKey = "a5f1b980a72b26fba552d7fdb96a1390"
        return apiKey
    }
    case getMovieDetail(Int)
    case fetchTopRatedMovies(Int)
    

    var description: String {
        switch self {
        case .fetchTopRatedMovies(let page):
            return "movie/top_rated?api_key=\(getAPIKey)&page=\(page)"
        case .getMovieDetail(let movieId):
            return "movie/\(movieId)?api_key=\(getAPIKey)"
        }
    }
}
