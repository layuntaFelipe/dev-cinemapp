//
//  ContentView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 03/07/21.
//

import SwiftUI

// First Screen
struct ContentView: View {
    
    // object responsible for the API network
    @ObservedObject var networkManager = NetworkManager()
    
    @State var textFieldText: String = ""
    @State var showDetailView: Bool = false
    @State var showFavorites: Bool = false
    @State var id: String = ""
    @State var favoritesMovies = [FavoritesMoviesModel]()
    @State var star: Bool = false
    @State var visitDetail: Bool = false
    
    var body: some View {
        ZStack{
            Color("background").ignoresSafeArea()
            if !showDetailView {
                ScrollView(.vertical, showsIndicators: false){
                    HeaderView()
                    SearchView(networkManager: networkManager)
                    ScrollMoviesView(networkManager: networkManager, showDetailView: $showDetailView, star: $star, id: $id)
                    
                    HStack{
                        Text("Favorites Movies ⭐️")
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                    .padding()
                    
                    if showFavorites {
                        FavoritesMoviesView(favoritesMovies: $favoritesMovies, id: $id, star: $star, showDetailView: $showDetailView)
                    }
                }
                .onAppear(perform: {
                    if visitDetail {
                        print("Turn to true showFavorites")
                        showFavorites = true
                    }
                })
                .padding(.bottom)
                
            } else {
                DetailView(id: id, star: $star, showDetailView: $showDetailView, favoritesMovies: $favoritesMovies, visitDetail: $visitDetail)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
