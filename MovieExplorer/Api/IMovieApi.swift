//
//  IMovieApi.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

protocol IMovieApi {
    
    func getImagesConfiguration(apiKey: String) -> Observable<ImagesConfigurationResponse?>
    
    func getPopularMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?>
    
    func getTopRatedMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?>
    
    func getNowPlayingMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?>
}
