//
//  ActivityIndicator.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 12/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    
    var configuration = {
        (indicator: UIActivityIndicatorView) in
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (UIActivityIndicatorView) -> Void) -> Self {
        Self.init(isAnimating: self.$isAnimating, configuration: configuration)
    }
}

//struct ActivityIndicator_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ActivityIndicator(isAnimating: true)
//    }
//}
