//
//  MoviesViewControllerDelegate.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesViewControllerDelegate: BaseViewControllerDelegate {
    
    func showMovies(movies: [Movie])
}
