//
//  MovieCelda.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 18/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct MovieCelda: View {
    var movie: Movie
    
    var body: some View {
        HStack{
            Text(movie.title)
            Spacer()
            Text(movie.releaseDate)
        }
    }
}

struct MovieCelda_Previews: PreviewProvider {
    static var previews: some View {
        MovieCelda(movie: moviesSampleData.results[1])
    }
}
