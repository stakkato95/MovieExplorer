//
//  DetailViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, IDetailView {
    
    var p: IDetailPresenter?
    var presenter: IDetailPresenter {
        get {
            if p == nil {
                p = DependencyContainer.container.resolve(IDetailPresenter.self)!
            }
            
            return p!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadData()
    }
    
    func showSimilarMovies(similarMovies: [Movie]?) {
        
    }
    
    func showError(errorMessage: String) {
        
    }
    
    func setMovieInfo(movie: Movie) {
        presenter.setMovie(movie: movie)
    }
}
