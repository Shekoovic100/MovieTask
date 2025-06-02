//
//  HomeView.swift
//  MovieTask
//
//  Created by sherif on 02/06/2025.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    private var adptiveFixedColumns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: adptiveFixedColumns,pinnedViews: .sectionHeaders) {
                    ForEach(Array(viewModel.upComingList.enumerated()),id: \.offset) { index,movie in
                        UpComingCellRow(movie: movie)
                            .onAppear {
                                if movie.id == viewModel.upComingList.last?.id {
                                    viewModel.loadData()
                                }
                            }
                    }
                }
                .navigationTitle("Discover")
                .navigationBarTitleDisplayMode(.automatic)
                .foregroundStyle(.primary)
                .task {
                    await viewModel.fetchUpComingMovies()
                }
                .environmentObject(viewModel)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    let movieService = MovieServicesImplement()
    let movieRepository = MovieRepository(movieService: movieService)
    let getMoviesUseCase = GetMoviesUseCase(repository: movieRepository)
    let viewModel = ViewModel(getMoviesUseCase: getMoviesUseCase)
    HomeView()
        .environmentObject(viewModel)
}
