//
//  SearchView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 04/07/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var textFieldText: String = ""
    @ObservedObject var networkManager = NetworkManager()
    
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var showDetailView: Bool = false
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
                    .padding()
                    
                    

                }
            } 
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
