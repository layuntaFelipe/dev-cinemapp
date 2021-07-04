//
//  LoadImageExtension.swift
//  CinemaApp
//
//  Created by Felipe Lobo on 03/07/21.
//

import Foundation
import SwiftUI

extension String {
    func loadImage() -> UIImage {
        
        do {
            guard let url = URL(string: self) else {
                
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
            
        } catch {
            
        }
        
        return UIImage()
    }
}
