//
//  MovieRow.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 10/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    private var movieInfo: MovieInfoCell
    init(movie: Movie) {
        self.movieInfo = MovieInfoCell(movie: movie)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            CircleImage(imageUrl: self.movieInfo.imageURL)
            VStack(alignment: .leading, spacing: 10) {
                Text(self.movieInfo.title)
                Text(self.movieInfo.releaseDate)
            }
            Spacer()
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: moviesSampleData.results[1])
            .previewLayout(.fixed(width: 414, height: 80))
    }
}
