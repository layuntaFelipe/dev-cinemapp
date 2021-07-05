//
//  ContentView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    @State var textFieldText: String = ""
    @State var showDetailView: Bool = false
    @State var showFavorites: Bool = false
    @State var id: String = ""
    @State var favoritesMovies = [FavoritesMovies]()
    @State var star: Bool = false
    
    var body: some View {
        ZStack{
            Color("background").ignoresSafeArea()
            if !showDetailView {
                ScrollView(.vertical, showsIndicators: false){
                    HeaderView()
                    SearchView(networkManager: networkManager)
                    ScrollMoviesView(networkManager: networkManager, showDetailView: $showDetailView, star: $star, id: $id)
                    
                    HStack{
                        Text("Favorites Movies")
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                        Button(action: {
                            print(favoritesMovies)
                            showFavorites.toggle()
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Text("⭐️")
                        })
                        Spacer()
                    }
                    .padding()
                    
                    if showFavorites {
                        FavoritesMoviesView(favoritesMovies: $favoritesMovies, id: $id, star: $star, showDetailView: $showDetailView)
                    }
                }
                .padding(.bottom)
                
            } else {
                DetailView(id: id, star: $star, showDetailView: $showDetailView, favoritesMovies: $favoritesMovies)
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
