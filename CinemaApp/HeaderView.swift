//
//  HeaderView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 03/07/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Hello, Felipe")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                Text("Ready to watch some movies ?")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 55)
                .foregroundColor(.white)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
    }
}
