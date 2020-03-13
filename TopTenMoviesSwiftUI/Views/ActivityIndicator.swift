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
    var delay: Double
    
    var configuration = {
        (indicator: UIActivityIndicatorView) in
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : stopWithDelay(uiView)
        configuration(uiView)
    }
    
    private func startAnimating(_ activity: UIActivityIndicatorView) {
        
    }
    
    private func stopWithDelay(_ activity: UIActivityIndicatorView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            activity.stopAnimating()
            activity.backgroundColor = .clear
        }
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (UIActivityIndicatorView) -> Void) -> Self {
        Self.init(isAnimating: self.$isAnimating, delay: self.delay, configuration: configuration)
    }
}

//struct ActivityIndicator_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ActivityIndicator(isAnimating: true)
//    }
//}
