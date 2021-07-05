//
//  MoviesModel.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation

// Model with the detail movie information required
class MoviesDetailModel: ObservableObject {
    @Published var title: String = ""
    @Published var year: String = ""
    @Published var rated: String = ""
    @Published var runtime: String = ""
    @Published var genre: String = ""
    @Published var director: String = ""
    @Published var writer: String = ""
    @Published var actors: String = ""
    @Published var plot: String = ""
    @Published var awards: String = ""
    @Published var posterUrl: String = ""
    @Published var imdbRating: String = ""
    @Published var production: String = ""
}

// Model with the favorite movies information required
struct FavoritesMoviesModel: Identifiable, Equatable{
    let id: String
    let url: String
}
