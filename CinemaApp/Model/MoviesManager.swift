//
//  MoviesManager.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var movieName = String()
//    @Published var movieYear = String()
//    @Published var movieRated = String()
//    @Published var movieRuntime = String()
//    @Published var movieGenre = String()
//    @Published var movieDirector = String()
//    @Published var movieWriter = String()
//    @Published var movieActors = String()
//    @Published var moviePlot = String()
//    @Published var movieAwards = String()
//    @Published var moviePoster = String()
//    @Published var movieRating = String()
//    @Published var movieProduction = String()
    
    @State var movieDetailModel = MoviesDetailModel()
    @Published var search = [Search]()
    
    func searchData(searchName: String) {
        if let url = URL(string: "https://www.omdbapi.com/?apikey=925eba28&s=\(searchName)&type=movie") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async { [self] in
                                search = results.Search
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .resume()
        }
    }
    
    func lastReleased(id: String) {
        if let url = URL(string: "https://www.omdbapi.com/?apikey=925eba28&i=\(id)") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Detail.self, from: safeData)
                            DispatchQueue.main.async {
                                self.movieDetailModel.title = results.Title
                                self.movieDetailModel.year = results.Year
                                self.movieDetailModel.rated = results.Rated
                                self.movieDetailModel.runtime = results.Runtime
                                self.movieDetailModel.genre = results.Genre
                                self.movieDetailModel.director = results.Director
                                self.movieDetailModel.writer = results.Writer
                                self.movieDetailModel.actors = results.Actors
                                self.movieDetailModel.plot = results.Plot
                                self.movieDetailModel.awards = results.Awards
                                self.movieDetailModel.posterUrl = results.Poster
                                self.movieDetailModel.imdbRating = results.imdbRating
                                self.movieDetailModel.production = results.Production
                                
                                self.movieName = results.Title
                                
//                                self.movieYear = results.Year
//                                self.movieRated = results.Rated
//                                self.movieRuntime = results.Runtime
//                                self.movieGenre = results.Genre
//                                self.movieDirector = results.Director
//                                self.movieWriter = results.Writer
//                                self.movieActors = results.Actors
//                                self.moviePlot = results.Plot
//                                self.movieAwards = results.Awards
//                                self.moviePoster = results.Poster
//                                self.movieRating = results.imdbRating
//                                self.movieProduction = results.Production
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .resume()
        }
    }
}
