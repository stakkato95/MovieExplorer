//
//  IDetailView.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

protocol IDetailView: IView {
    
    func showSimilarMovies(similarMovies: [Movie]?)
}
