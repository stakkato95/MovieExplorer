//
//  MoviesPresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesPresenter: BasePresenterDelegate {
    
    var basePresenter: BasePresenter<MoviesViewController>?
    
    convenience init(viewController: MoviesViewControllerDelegate) {
        self.init(viewController: viewController)
        basePresenter?.delegate = self
    }
    
    func loadData() {
        print("loaded in movies")
    }
}
