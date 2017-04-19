//
//  IMovieClient.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

protocol IMovieClient {
    
    func getImagesConfiguration() -> Observable<ImagesConfiguration?>
    
    func getPopularMovies(pageOrdinal: Int) -> Observable<[Movie]?>
    
    func getTopRatedMovies(pageOrdinal: Int) -> Observable<[Movie]?>
    
    func getNowPlayingMovies(pageOrdinal: Int) -> Observable<[Movie]?>
}
