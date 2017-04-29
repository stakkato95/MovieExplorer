//
//  MoviesViewControllerDelegate.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

protocol IMoviesView: IView {
    
    func showMovies(moviesCollection: (nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?))
}
