//
//  SwiftUIViewExample.swift
//  TopTenMoviesSwiftUI
//
//  Created by Abraham Escamilla Pinelo on 18/03/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import SwiftUI

struct SwiftUIViewExample: View {
    var movies: [Movie]
    var joteria: String = "Joteria"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(joteria)
                List(movies, id: \.self) { item in
                    MovieCelda(movie: item)
                        
                        .frame(width: 300, height: 120)
                    .background(Color.blue)
                        
                }
            }
            
            
            .navigationBarTitle("Mi titlo")
        }
    }
}

struct SwiftUIViewExample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewExample(movies: moviesSampleData.results)
    }
}
