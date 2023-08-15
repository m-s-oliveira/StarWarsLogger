//
//  MovieListView.swift
//  StarWars
//
//  Created by Matheus Oliveira on 07/08/23.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: MovieListViewModel = MovieListViewModel()
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies, id: \.name) { movie in
                    HStack(spacing: 8) {
                        Image(movie.poster)
                            .resizable()
                            .frame(width: 90, height: 136)
                        
                        Text("\(movie.name) **(\(movie.releaseYear))**")
                            .multilineTextAlignment(.center)
                    }
                }
            }
            
            .navigationTitle("Movies")
            .onAppear {
                viewModel.loadMoviesList()
            }
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        fatalError("Oops! The app crashed!")
                    } label: {
                        Image(systemName: "exclamationmark.triangle.fill")
                    }
                }
                    
                    
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        ShareLogsView()
                    } label: {
                        Image(systemName: "doc.text.fill")
                    }
                }
            }
        }
    }
}

// MARK: - Preview

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
