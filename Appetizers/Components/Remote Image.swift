//
//  Remote Image.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/28/26.
//

import Foundation
import SwiftUI
import Combine

final class ImageLoader:ObservableObject{
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString){uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
   var image : Image?
    var body: some View {
        image?.resizable() ?? Image(systemName: "photo").resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var Imageloader = ImageLoader()
    let urlString: String
    
    var body: some View {
        
        RemoteImage(image: Imageloader.image)
            .onAppear{Imageloader.load(fromURLString: urlString)}
    }
    
}
