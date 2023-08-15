//
//  Movie.swift
//  StarWars
//
//  Created by Matheus Oliveira on 07/08/23.
//

import Foundation

/// Represents a movie to be displayed on `MovieListView`.
struct Movie: Decodable {
    
    /// Movie name.
    let name: String
    
    /// Year that the movie was released.
    let releaseYear: String
    
    /// Poster image name.
    let poster: String
}
