//
//  ContentView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 03/07/21.
//

import SwiftUI

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

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    @State var textFieldText: String = ""
    
    // Simple Grid Definition
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var showDetailView = false
    
    @State var id: String = ""
    
    var body: some View {
        ZStack{
            Color("background").ignoresSafeArea()
            if !showDetailView {
                ScrollView(.vertical, showsIndicators: false){
                    HStack{
                        TextField("Type something here...", text: $textFieldText)
                            .padding()
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            .foregroundColor(Color("background"))
                            .font(.headline)

                        Button(action: {
                            networkManager.searchData(searchName: textFieldText)
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                                .foregroundColor(.white)
                        })
                    }

                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(networkManager.search) {search in
                            Button(action: {
                                showDetailView.toggle()
                                id = search.imdbID
                            }, label: {
                                Image(uiImage: search.Poster.loadImage())
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            })
                        }
                    }

                    Text(networkManager.totalResults)
                        .foregroundColor(.white)
                }
                .padding()
                .edgesIgnoringSafeArea(.bottom)
            } else {
                DetailView(id: id, showDetailView: $showDetailView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
