//
//  UpComingCellRow.swift
//  MovieTask
//
//  Created by sherif on 03/06/2025.
//

import SwiftUI

struct UpComingCellRow: View {

    @EnvironmentObject var viewModel: ViewModel
    let movie: UpComingResults
    
    var body: some View {
        VStack {
            CashedImageView(imageUrlString: viewModel.imageDomainUrl + (movie.posterPath ?? ""), width: 180, height: 180)
                Text(movie.title ?? "")
                .font(.subheadline.bold())
                .foregroundStyle(.black)
                   
            }
        .environmentObject(viewModel)
    }
}
