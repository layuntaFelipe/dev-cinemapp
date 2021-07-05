//
//  MoviePlotView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

//Detail Movie Plot View
struct MoviePlotView: View {
    
    let plotText: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Text("Plot")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                
                Spacer()
            }
            Text(plotText)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.top,8)
        
    }
}

struct MoviePlotView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePlotView(plotText: "")
            .previewLayout(.sizeThatFits)
    }
}
