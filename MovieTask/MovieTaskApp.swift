//
//  MovieTaskApp.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import SwiftUI

@main
struct MovieTaskApp: App {
    var body: some Scene {
        WindowGroup {
            let movieService = MovieServicesImplement()
            let movieRepository = MovieRepository(movieService: movieService)
            let getMoviesUseCase = GetMoviesUseCase(repository: movieRepository)
            let viewModel = ViewModel(getMoviesUseCase: getMoviesUseCase)
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
