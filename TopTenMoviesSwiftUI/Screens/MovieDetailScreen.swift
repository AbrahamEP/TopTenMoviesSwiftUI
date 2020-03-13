//
//  MovieDetailScreen.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 11/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    var movieInfo: MovieDetailViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                Text(self.movieInfo.title)
                            .font(.largeTitle)
                        ImageSlider(imagesUrls: [self.movieInfo.imageFrontUrl, self.movieInfo.imageBackUrl])
                            .frame(height: geo.size.height * 0.35)
                        
                HStack {
                    Text(self.movieInfo.releaseDate)
                        .font(.headline)
                    Spacer()
                    Text("Rating: \(self.movieInfo.rating)")
                        .font(.headline)
                        .foregroundColor(.green)
                }
                HStack {
                    Text("Overview")
                        .font(.headline)
                        .padding(.bottom, 10)
                        Spacer()
                }
                Text(self.movieInfo.overview)
                Spacer()
                
                
            }
            .padding(16)
        }
        .navigationBarTitle("Movie", displayMode: .inline)
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailScreen(movieInfo: MovieDetailViewModel(movie: moviesSampleData.results[1]))
        }
    }
}
