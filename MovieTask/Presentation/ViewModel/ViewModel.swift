//
//  ViewModel.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    
    @Published private(set) var upComingList: [UpComingResults] = []
    @Published var isLoading: Bool = false
    
    private let moviesUseCase: GetMoviesUseCaseProtocol
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let iMDBBaseURl = "https://www.imdb.com/title/"
    private let imdbActorURL = "https://www.imdb.com/name/"
    private var currentPage = 1
    private var totalPages = 1
    
    init(getMoviesUseCase: GetMoviesUseCase) {
        self.moviesUseCase = getMoviesUseCase
    }
    
    var imageDomainUrl: String {
        return imageBaseUrl
    }
    
    
    
    func fetchUpComingMovies() async {
     
        do {
            currentPage += 1
            let upComingData = try await moviesUseCase.excuteUpcomingMovie(page: currentPage)
            upComingList.append(contentsOf: upComingData.results)
            totalPages = upComingData.totalPages
        }catch {
            print("Error in fetching upComing Movies")
        }
    }
    
    func loadData() {
        Task(priority: .medium){
             await fetchUpComingMovies()
        }
    }

}
