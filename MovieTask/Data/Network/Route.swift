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
         let apiKey = ""
        return apiKey
    }
    case upComingMovies(Int)
    

    var description: String {
        switch self {
        case .upComingMovies(let page):
            return "movie/upcoming?api_key=\(getAPIKey)&page=\(page)"

        }
    }
}
