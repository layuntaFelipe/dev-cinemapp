//
//  DetailView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 04/07/21.
//

import SwiftUI

// Detail View of a Movie
struct DetailView: View {
    
    // object responsible for the API network
    @ObservedObject var networkManager = NetworkManager()
    
    @State var id: String
    @Binding var star: Bool
    @Binding var showDetailView: Bool
    
    @Binding var favoritesMovies: [FavoritesMoviesModel]
    
    @State var isAnimating: Bool = false
    @Binding var visitDetail: Bool
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Spacer()
                    VStack(spacing: 50){
                        Button(action: {
                            showDetailView.toggle()
                            visitDetail = true
                        }, label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.gray.opacity(0.2))
                                .shadow(color: .white, radius: 1, x: 0.0, y: 0.0)
                                .frame(width: 60, height: 60)
                        })
                        .padding(.top)
                        VerticalInfoView(space: 25, movieInfo: networkManager.movieDetailModel.runtime, movieIcon: "clock")
                        VerticalInfoView(space: 19, movieInfo: networkManager.movieDetailModel.year, movieIcon: "calendar")
                        VerticalInfoView(space: 10, movieInfo: networkManager.movieDetailModel.imdbRating, movieIcon: "star")
                    }
                    Spacer()
                    MainPosterView(imageURL: networkManager.movieDetailModel.posterUrl, isAnimating: isAnimating)
                }
                
                MovieMainInfoView(networkManager: networkManager, star: $star, favoritesMovies: $favoritesMovies, showDetailView: $showDetailView, id: $id)
                
                MoviePlotView(plotText: networkManager.movieDetailModel.plot)
            }
            .onAppear(perform: {
                networkManager.loadIdDetailMovie(id: id)
            })
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "tt4154664", star: .constant(false), showDetailView: .constant(false), favoritesMovies: .constant([FavoritesMoviesModel(id: "", url: "")]), visitDetail: .constant(false))
    }
}
