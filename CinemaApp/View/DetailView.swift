//
//  DetailView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 04/07/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    @State var id: String
    @Binding var star: Bool
    @Binding var showDetailView: Bool
    
    @Binding var favoritesMovies: [FavoritesMovies]
    
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
                        
                        
                        VerticalInfoView(space: 25, movieTime: networkManager.movieRuntime, movieIcon: "clock")
                        VerticalInfoView(space: 19, movieTime: networkManager.movieYear, movieIcon: "calendar")
                        VerticalInfoView(space: 10, movieTime: networkManager.movieRating, movieIcon: "star")
                    }
                    Spacer()
                    MainPosterView(imageURL: networkManager.moviePoster, isAnimating: isAnimating)
                }
                
                MovieMainInfoView(networkManager: networkManager, star: $star, favoritesMovies: $favoritesMovies, showDetailView: $showDetailView, id: $id)
                
                MoviePlotView(plotText: networkManager.moviePlot)
            }
            .onAppear(perform: {
                networkManager.lastReleased(id: id)
            })
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "tt4154664", star: .constant(false), showDetailView: .constant(false), favoritesMovies: .constant([FavoritesMovies(id: "", url: "")]), visitDetail: .constant(false))
    }
}
