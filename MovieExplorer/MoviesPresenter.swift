//
//  MoviesPresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesPresenter<UseCase: IMoviesUaseCase>: IMoviePresenter {
    
    let moviesUseCase: UseCase
    
    init(moviesUseCase: UseCase) {
        self.moviesUseCase = moviesUseCase
    }
    
    func loadData() {
//        moviesUseCase.loadData()
    }
    
    func navigateToDetail() {
        
    }
}
