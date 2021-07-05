//
//  ScrollMoviesView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

// Horizontal scroll with the results movies from search
struct ScrollMoviesView: View {
    
    @ObservedObject var networkManager: NetworkManager
    @Binding var showDetailView: Bool
    @Binding var star: Bool
    @Binding var id: String
    
    var body: some View {
        //Horizontal scroll
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                //Looping through list of movies
                ForEach(networkManager.search) {search in
                    //Button that goes to the DetailView and loads the information from the movie tapped
                    Button(action: {
                        showDetailView.toggle()
                        star = false
                        id = search.imdbID
                    }, label: {
                        Image(uiImage: search.Poster.loadImage())
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .shadow(color: .blue.opacity(0.5), radius: 15, x: 0, y: 0)
                            .padding()
                    })
                    .frame(width: 233, height: 320)
                }
            }
        }
        .padding(.vertical)
    }
}

struct ScrollMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMoviesView(networkManager: NetworkManager(), showDetailView: .constant(false), star: .constant(false), id: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
