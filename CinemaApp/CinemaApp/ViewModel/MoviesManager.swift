//
//  MoviesManager.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import Foundation
import SwiftUI

// class responsible for organazing our API calls into our Models
class NetworkManager: ObservableObject {
    
    @State var movieDetailModel = MoviesDetailModel()
    @Published var search = [Search]()
    @Published var movieName = String()
    
    // function that request the list of movies from a title passed by the user
    func searchSimpleMovie(searchName: String) {
        //Creating the URL from a string with the search title
        if let url = URL(string: "https://www.omdbapi.com/?apikey=925eba28&s=\(searchName)&type=movie") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            //Getting the data back
                            let results = try decoder.decode(Results.self, from: safeData)
                            //Updating the UI using the main threat
                            DispatchQueue.main.async { [self] in
                                search = results.Search
                            }
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    print(error ?? "Error on searchSimpleMovie decoder")
                }
            }
            .resume()
        }
    }
    
    // function that request the detail information of a movie passed by a ID from the user
    func loadIdDetailMovie(id: String) {
        //Creating the URL from a string with the ID from the movie
        if let url = URL(string: "https://www.omdbapi.com/?apikey=925eba28&i=\(id)") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            //Getting the data back
                            let results = try decoder.decode(Detail.self, from: safeData)
                            //Updating the UI using the main threat
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
                            }
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    print(error ?? "Error on loadIdDetailMovie decoder")
                }
            }
            .resume()
        }
    }
}
