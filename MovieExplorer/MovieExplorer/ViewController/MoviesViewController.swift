//
//  MoviesViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesViewController: UIViewController, IMoviesView {
    
    var p: IMoviePresenter!
    var presenter: IMoviePresenter {
        get {
            if p == nil {
                p = DependencyContainer.container.resolve(IMoviePresenter.self)!
                p.
            }
            return p
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func showError(errorMessage: String) {
        
    }
    
    func showMovies(movies: [Movie]) {
    }
}
