//
//  MoviesManager.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var search = [Search]()
    @Published var totalResults = String()
    
    
    @Published var movieName = String()
    @Published var movieYear = String()
    @Published var movieRated = String()
    @Published var movieRuntime = String()
    @Published var movieGenre = String()
    @Published var movieDirector = String()
    @Published var movieWriter = String()
    @Published var movieActors = String()
    @Published var moviePlot = String()
    @Published var movieAwards = String()
    @Published var moviePoster = String()
    @Published var movieRating = String()
    @Published var movieProduction = String()
    
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
                                totalResults = results.totalResults
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
                                self.movieName = results.Title
                                self.movieYear = results.Year
                                self.movieRated = results.Rated
                                self.movieRuntime = results.Runtime
                                self.movieGenre = results.Genre
                                self.movieDirector = results.Director
                                self.movieWriter = results.Writer
                                self.movieActors = results.Actors
                                self.moviePlot = results.Plot
                                self.movieAwards = results.Awards
                                self.moviePoster = results.Poster
                                self.movieRating = results.imdbRating
                                self.movieProduction = results.Production
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
