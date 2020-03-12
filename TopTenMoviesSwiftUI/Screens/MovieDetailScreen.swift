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
        VStack(spacing: 10) {
            Text(movieInfo.title)
                .font(.largeTitle)
            Image("MoviePlaceholder")
            HStack {
                Text(movieInfo.releaseDate)
                    .font(.headline)
                Spacer()
                Text("Rating: \(movieInfo.rating)")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            HStack {
                Text("Overview")
                    .font(.headline)
                    .padding(.bottom, 10)
                Spacer()
            }
            Text(movieInfo.overview)
            Spacer()
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailScreen(movieInfo: MovieDetailViewModel(movie: moviesSampleData.results[1]))
        }
    }
}
