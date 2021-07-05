//
//  MoviesData.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation

struct Results: Decodable {
    let Search: [Search]
    let totalResults: String
}

struct Search: Decodable, Identifiable {
    var id: String {
        return imdbID
    }
    var Title: String
    let Year: String
    let imdbID: String
    let Poster: String
    
    func name() -> String {
        return "\(Title)!"
    }
}

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
