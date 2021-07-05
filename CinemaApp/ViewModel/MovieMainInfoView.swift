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
    @Binding var favoritesMovies: [FavoritesMovies]
    @Binding var showDetailView: Bool
    @Binding var id: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(networkManager.movieName)
                        .foregroundColor(.white)
                        .font(.system(size: 29, weight: .semibold, design: .rounded))
                    Spacer()
                    Button(action: {
                        star.toggle()
                        let movie = FavoritesMovies(id: id, url: networkManager.moviePoster)
                        if star {
                            favoritesMovies.append(movie)
                        } else {
                            print("delete")
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
                        Image(systemName: star ? "star.fill" : "star")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(star ? .yellow : .gray)
                            .frame(width: 30, height: 30)
                    })
                    .padding()
                }
                
                Text(networkManager.movieDirector)
                    .foregroundColor(.white)
                Text(networkManager.movieGenre)
                    .foregroundColor(.white)
                
            }
            .padding()
            Spacer()
        }
    }
}

struct MovieMainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainInfoView(networkManager: NetworkManager(), star: .constant(false), favoritesMovies: .constant([FavoritesMovies(id: "", url: "")]), showDetailView: .constant(false), id: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
