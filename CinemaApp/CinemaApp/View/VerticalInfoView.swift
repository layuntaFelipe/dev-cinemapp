//
//  VerticalInfoView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

// Simple Vertical Info
struct VerticalInfoView: View {
    
    //Spacing between a vertical item and another
    let space: CGFloat
    let movieInfo: String
    let movieIcon: String
    
    var body: some View {
        VStack(spacing: space){
            Text(movieInfo)
                .foregroundColor(.white)
                .rotationEffect(.degrees(-90))
            Image(systemName: movieIcon)
                .foregroundColor(.gray)
                .rotationEffect(.degrees(-90))
        }
    }
}

struct VerticalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalInfoView(space: 25, movieInfo: "", movieIcon: "")
            .previewLayout(.sizeThatFits)
    }
}
