//
//  DetailView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 04/07/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var id: String
    @Binding var star: Bool
    @Binding var showDetailView: Bool
    
    @Binding var favoritesMovies: [FavoritesMovies]
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Spacer()
                    VStack(spacing: 50){
                        
                        Button(action: {
                            showDetailView.toggle()
                        }, label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.gray.opacity(0.2))
                                .shadow(color: .white, radius: 1, x: 0.0, y: 0.0)
                                .frame(width: 60, height: 60)
                        })
                        .padding(.top)
                        
                        VStack(spacing: 25){
                            Text(networkManager.movieRuntime)
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                                .rotationEffect(.degrees(-90))
                        }
                        VStack(spacing: 19){
                            Text(networkManager.movieYear)
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                                .rotationEffect(.degrees(-90))
                        }
                        
                        VStack(spacing: 10){
                            Text(networkManager.movieRating)
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                                .rotationEffect(.degrees(-90))
                        }
                    }
                    Spacer()
                    Image(uiImage: networkManager.moviePoster.loadImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 500, alignment: .top)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 10, x: -3.0, y: 3.0)
                }
                
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
                                favoritesMovies.append(movie)
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
                
                Group {
                    HStack{
                        Text("Plot")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold, design: .rounded))
                        
                        Spacer()
                    }
                    Text(networkManager.moviePlot)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top,8)
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
        DetailView(id: "tt4154664", star: .constant(false), showDetailView: .constant(false), favoritesMovies: .constant([FavoritesMovies(id: "", url: "")]))
    }
}
