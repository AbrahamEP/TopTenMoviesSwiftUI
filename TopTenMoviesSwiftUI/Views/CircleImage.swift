//
//  CircleImage.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 10/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    var imageUrl: URL?
    var body: some View {
        WebImage(url: imageUrl)
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageUrl: URL(string: "https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/peliculas/interstellar/posters/18799170-1-esl-ES/Posters.jpg?resize=980:*"))
    }
}
