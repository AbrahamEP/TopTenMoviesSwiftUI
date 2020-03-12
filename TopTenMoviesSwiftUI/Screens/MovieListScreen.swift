//
//  MovieListScreen.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 10/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    @State var isFetching: Bool = false
    
    @State var movies: [Movie]
    @State var isAlertVisible: Bool = false
    
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
            ZStack {
                moviesList
                ActivityIndicator(isAnimating: $isFetching)
                    .configure {
                        $0.color = .red
                        $0.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                        
                    }
                    .background(Color.yellow)
                    .cornerRadius(100)
                    .frame(width: 100, height: 100)
            }
            
            
            .navigationBarTitle(Text("Top 10 Rated"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.getMovies()
                }, label: {
                    Text("refresh")
                })
            )
        }
        .onAppear {
            
            self.getMovies()
        }
    }
    
    private func getMovies(completion: (() -> Void)? = nil) {
        self.isFetching = true
        API.shared.getMovies { (movies, errorMessage) in
            self.isFetching = false
            
            guard let movies = movies else {
                //An error ocurred. Show it to the user
                if let completion = completion {
                    completion()
                }
                if let errorMessage = errorMessage {
//                    self.showAlertOneButtonWith(alertTitle: errorMessage, alertMessage: nil, buttonTitle: "Aceptar")
                    //TODO: Add alert view
                }else {
//                    self.showAlertOneButtonWith(alertTitle: "Ocurrió un error", alertMessage: nil, buttonTitle: "Aceptar")
                }
                return
            }

            self.movies = movies
            
            if let completion = completion {
                completion()
            }
        }
    }
    
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen(movies: moviesSampleData.results)
    }
}
