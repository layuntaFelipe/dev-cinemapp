//
//  MoviesData.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation

// API first Data
struct Results: Decodable {
    let Search: [Search]
    let totalResults: String
}

// API Data from a title movie showing main info
struct Search: Decodable, Identifiable {
    var id: String {
        return imdbID
    }
    var Title: String
    let Year: String
    let imdbID: String
    let Poster: String
}

// API Data from ID showing the detail info from a movie
struct Detail: Decodable {
    var Title: String
    let Year: String
    let Rated: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let Awards: String
    let Poster: String
    let imdbRating: String
    let Production: String
}
