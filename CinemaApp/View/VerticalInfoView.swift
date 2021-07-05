//
//  VerticalInfoView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

struct VerticalInfoView: View {
    
    let space: Int
    let movieTime: String
    let movieIcon: String
    
    var body: some View {
        VStack(spacing: 25){
            Text(movieTime)
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
        VerticalInfoView(space: 25, movieTime: "", movieIcon: "")
            .previewLayout(.sizeThatFits)
    }
}
