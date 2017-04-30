//
//  DetailPresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class DetailPresenter: IDetailPresenter {
    
    var detailUseCase: IDetailUseCase
    
    var view: IDetailView!
    
    var movie: Movie?
    
    init(detailUseCase: IDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func setView(view: Any?) {
        self.view = view as! IDetailView
    }
    
    func setMovie(movie: Movie) {
        self.movie = movie
    }
    
    func loadData() {
        detailUseCase
            .loadData(movieId: movie!.id!)
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: DispatchQoS.utility))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { movies in
                self.view.showSimilarMovies(similarMovies: movies)
            }, onError: { error in
                self.view.showError(errorMessage: error.localizedDescription)
            })
    }
}
