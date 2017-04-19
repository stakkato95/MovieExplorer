//
//  MoviesPresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesPresenter: IMoviePresenter {
    
    let moviesUseCase: IMoviesUaseCase
    
    init(moviesUseCase: IMoviesUaseCase) {
        self.moviesUseCase = moviesUseCase
    }
    
    func loadData() {
//        moviesUseCase.loadData()
    }
    
    func navigateToDetail() {
        
    }
}
