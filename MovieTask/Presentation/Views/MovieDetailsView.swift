//
//  MovieDetailsView.swift
//  MovieTask
//
//  Created by sherif on 03/06/2025.
//

import SwiftUI

struct MovieDetailsView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: MovieDetailsVC, context: Context) {
        //
    }
    
   
    let movie: UpComingResults
    
    func makeUIViewController(context: Context) -> MovieDetailsVC {
        return MovieDetailsVC(movie: movie)
    }

}

