//
//  UpComingModel.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation


struct UpComingModel: Codable {
    
    let page: Int
    let results: [UpComingResults]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
           case page, results
           case totalPages = "total_pages"
           case totalResults = "total_results"
       }
}

struct UpComingResults: Codable,Identifiable, Hashable {

    let id: Int
    let overview: String?
    let posterPath: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case title

    }
    
    init(id: Int , overview: String? = nil, posterPath: String? = nil, title: String? = nil) {
        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.title = title
   }
   
}
