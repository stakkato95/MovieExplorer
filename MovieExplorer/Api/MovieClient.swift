//
//  MovieApi.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/14/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

class MovieClient: IMovieClient {
    
    let apiKey: String
    
    let youTubeBaseUrl: String
    
    let api: IMovieApi
    
    init(api: IMovieApi, apiKey: String, youTubeBaseUrl: String) {
        self.apiKey = apiKey
        self.youTubeBaseUrl = youTubeBaseUrl
        self.api = api
    }
    
    func getImagesConfiguration() -> Observable<ImagesConfiguration?> {
        return api.getImagesConfiguration(apiKey: apiKey).map { event in event?.imagesConfiguration }
    }
    
    func getPopularMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        return api.getPopularMovies(apiKey: apiKey, pageOrdinal: pageOrdinal).map { event in event?.movies }
    }
    
    func getTopRatedMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        return api.getTopRatedMovies(apiKey: apiKey, pageOrdinal: pageOrdinal).map { event in event?.movies }
    }
    
    func getNowPlayingMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        return api.getNowPlayingMovies(apiKey: apiKey, pageOrdinal: pageOrdinal).map { event in event?.movies }
    }
}
