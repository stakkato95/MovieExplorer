//
//  IMoviesInteractor.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

protocol IMoviesUaseCase: IUseCase {
    
    typealias TResult = (nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?)
    
    func loadNexPortion(_ movieType: MovieType) -> Observable<[Movie]?>?
}

enum MovieType {
    case nowPlaying, topRated, popular
}
