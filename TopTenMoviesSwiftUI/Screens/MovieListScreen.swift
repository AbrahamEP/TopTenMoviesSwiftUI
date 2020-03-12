//
//  MovieListScreen.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 10/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    var movies: [Movie]
    var moviesList: some View {
        GeometryReader { geo in
            List(self.movies, id: \.self) { movie in
                
                NavigationLink(destination: MovieDetailScreen(movieInfo: MovieDetailViewModel(movie: movie))) {
                    
                    MovieRow(movie: movie)
                    .frame(height: geo.size.height * 0.1)
                }
                
            }
        }
    }
    
    var body: some View {
        NavigationView {
            moviesList
            
            .navigationBarTitle(Text("Top 10 Rated"))
        }
        
    }
    
    
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen(movies: moviesSampleData.results)
    }
}
