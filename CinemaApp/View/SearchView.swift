//
//  SearchView.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 05/07/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var networkManager: NetworkManager
    @State var textFieldText: String = ""
    
    var body: some View {
        HStack{
            TextField("Search for movie", text: $textFieldText, onCommit:  {
                UIApplication.shared.endEditing(networkManager: networkManager, textFieldText: textFieldText)
            })
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.white)
                .font(.headline)
            
            Button(action: {
                if textFieldText != ""{
                    UIApplication.shared.endEditing(networkManager: networkManager, textFieldText: textFieldText)
                    textFieldText = ""
                }
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                    .foregroundColor(.white)
            })
            .padding()
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(networkManager: NetworkManager())
            .previewLayout(.sizeThatFits)
    }
}

extension UIApplication {
    func endEditing(networkManager: NetworkManager, textFieldText: String) {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        networkManager.searchData(searchName: textFieldText)
    }
}
