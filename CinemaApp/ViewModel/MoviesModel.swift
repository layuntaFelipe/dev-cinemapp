//
//  MoviesModel.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation

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

struct FavoritesMoviesModel: Identifiable, Equatable{
    let id: String
    let url: String
}
