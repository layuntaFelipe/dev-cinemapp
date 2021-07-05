//
//  FavoritesMoviesView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

// Simple grid for the favorites movies
struct FavoritesMoviesView: View {
    
    // list of the favorites movies
    @Binding var favoritesMovies: [FavoritesMoviesModel]
    @Binding var id: String
    @Binding var star: Bool
    @Binding var showDetailView: Bool
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 20) {
            ForEach(favoritesMovies) {movie in
                Button(action: {
                    id = movie.id
                    star = true
                    showDetailView.toggle()
                    
                }, label: {
                    Image(uiImage: movie.url.loadImage())
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(color: .yellow.opacity(0.5), radius: 15, x: 0, y: 0)
                        .padding()
                })
            }
        }
        .padding(.horizontal)
    }
}

struct FavoritesMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesMoviesView(favoritesMovies: .constant([FavoritesMoviesModel(id: "", url: "")]), id: .constant(""), star: .constant(false), showDetailView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
