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
    
    var movieId: Int?
    
    init(detailUseCase: IDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func setView(view: Any?) {
        self.view = view as! IDetailView
    }
    
    func loadData() {
        guard movieId != nil else {
            return
        }
        
        detailUseCase
            .loadData(movieId: movieId!)
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: DispatchQoS.utility))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { movies in
                self.view.showSimilarMovies(similarMovies: movies)
            }, onError: { error in
                self.view.showError(errorMessage: error.localizedDescription)
            })
    }
}
