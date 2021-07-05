//
//  MainPosterView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

// Big poster image with aniamtion
struct MainPosterView: View {
    
    let imageURL: String
    @State var isAnimating: Bool
    
    var body: some View {
        //Poster Image
        Image(uiImage: imageURL.loadImage())
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 500, alignment: .top)
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: -3.0, y: 3.0)
            // changes that make the animation
            .offset(y: isAnimating ? 0 : -500)
            .onAppear(perform: {
                withAnimation(.easeOut(duration: 0.75)) {
                    isAnimating.toggle()
                }
            })
    }
}

struct MainPosterView_Previews: PreviewProvider {
    static var previews: some View {
        MainPosterView(imageURL: "", isAnimating: false)
            .previewLayout(.sizeThatFits)
    }
}
