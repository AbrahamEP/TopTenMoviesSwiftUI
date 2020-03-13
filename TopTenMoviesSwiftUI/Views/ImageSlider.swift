//
//  ImageSlider.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 13/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI
import ImageSlideshow

struct ImageSlider: UIViewRepresentable {
    var configuration: (ImageSlideshow) -> Void = { slider in }
    var imagesUrls: [URL?]
    
    func makeUIView(context: Context) -> ImageSlideshow {
        let slider = ImageSlideshow()
        slider.setImageInputs(imagesUrls.map({ url in
            guard let url = url else {
                return ImageSource(image: #imageLiteral(resourceName: "MoviePlaceholder"))
            }
            return SDWebImageSource(url: url, placeholder: #imageLiteral(resourceName: "MoviePlaceholder"))
        }))
        return slider
    }
    
    func updateUIView(_ imageSlide: ImageSlideshow, context: Context) {
        configuration(imageSlide)
    }
}

extension View where Self == ImageSlider {
    func configure(_ configuration: @escaping (ImageSlideshow) -> Void) -> Self {
        Self.init(configuration: configuration, imagesUrls: self.imagesUrls)
    }
}
