//
//  MoviesViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesViewController: BaseViewController<MoviesPresenter>, MoviesViewControllerDelegate {
    
    func showError(errorMessage: String) {
    }
    
    func getPresenter() -> Any {
        return MoviesPresenter(viewController: self)
    }
    
    func showMovies(movies: [Movie]) {
    }
}
