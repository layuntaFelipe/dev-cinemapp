//
//  MovieMainInfoView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

struct MovieMainInfoView: View {
    
    @ObservedObject var networkManager: NetworkManager
    
    @Binding var star: Bool
    @Binding var favoritesMovies: [FavoritesMoviesModel]
    @Binding var showDetailView: Bool
    @Binding var id: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    //Movie Title
                    Text(networkManager.movieDetailModel.title)
                        .foregroundColor(.white)
                        .font(.system(size: 29, weight: .semibold, design: .rounded))
                    Spacer()
                    //Movie Star Button
                    Button(action: {
                        // Star Button network
                        star.toggle()
                        feedback.notificationOccurred(.success)
                        let movie = FavoritesMoviesModel(id: id, url: networkManager.movieDetailModel.posterUrl)
                        if star {
                            // Adding movie to favorites
                            favoritesMovies.append(movie)
                        } else {
                            // Deleting movie from favorites
                            for num in 0..<favoritesMovies.count{
                                if favoritesMovies[num].id == movie.id {
                                    print("delete \(num)")
                                    showDetailView.toggle()
                                    favoritesMovies.remove(at: num)
                                    return
                                }
                                print(num)
                            }
                        }
                    }, label: {
                        //Button image changing depending of the boolean "star"
                        Image(systemName: star ? "star.fill" : "star")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(star ? .yellow : .gray)
                            .frame(width: 30, height: 30)
                    })
                    .padding()
                }
                
                //Movie Directors
                Text(networkManager.movieDetailModel.director)
                    .foregroundColor(.white)
                //Movie Genre
                Text(networkManager.movieDetailModel.genre)
                    .foregroundColor(.white)
                
            }
            .padding()
            Spacer()
        }
    }
}

struct MovieMainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainInfoView(networkManager: NetworkManager(), star: .constant(false), favoritesMovies: .constant([FavoritesMoviesModel(id: "", url: "")]), showDetailView: .constant(false), id: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
