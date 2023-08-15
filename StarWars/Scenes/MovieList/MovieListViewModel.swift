//
//  MovieListViewModel.swift
//  StarWars
//
//  Created by Matheus Oliveira on 07/08/23.
//

import Foundation
import os

class MovieListViewModel: ObservableObject, Loggable {
    
    // MARK: - Public Properties
    
    @Published var movies: [Movie] = []
    
    // MARK: - Public Methods

    /// Loads movies from `Movies.json` file.
    @MainActor
    func loadMoviesList() {
        loadInvalidJSON()
    }
    
    // MARK: - Private Methods
    
    private func loadInvalidJSON() {
        
        guard let path = Bundle.main.path(forResource: "InvalidJSON", ofType: "json")  else {
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let _ = try JSONDecoder().decode(Movie.self, from: data)
            /* An error is expected since we are trying to decode the InvalidJSON file */
            
        } catch {
            log("Error while getting InvalidJSON.json path.", privacy: .public)
            loadMoviesJSON()
        }
    }
    
    private func loadMoviesJSON() {
        guard let path = Bundle.main.path(forResource: "Movies", ofType: "json")  else {
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let result = try JSONDecoder().decode([Movie].self, from: data)
            
            log("Movies.json loaded successfully.")
            
            movies = result
            
        } catch {
            log("Error while getting Movies.json path.")
        }
    }
}
