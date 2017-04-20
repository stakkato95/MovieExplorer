//
//  MoviesPresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesPresenter<View: IMoviesView>: IMoviePresenter {
    
    var view: View?
    
    let moviesUseCase: IMoviesUaseCase
    
    init(moviesUseCase: IMoviesUaseCase) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setView(view: Any?) {
        self.view = (view as! View)
    }
    
    func loadData() {
        moviesUseCase
            .loadData()?
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: DispatchQoS.utility)).observeOn(MainScheduler.instance).subscribe(onNext: { movies in
                self.view?.showMovies(moviesCollection: movies)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
            });
    }
    
    func navigateToDetail() {
        
    }
}
