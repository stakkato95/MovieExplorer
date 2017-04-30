//
//  MoviesInteractor.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class MoviesUseCase: IMoviesUaseCase {
    
    let noPagesLoaded = 1
    
    let client: IMovieClient
    
    var lastLoadedPopularPage: Int
    var lastLoadedTopRatedPage: Int
    var lastLoadedNowPlayingPage: Int
    
    init(client: IMovieClient) {
        self.client = client
        self.lastLoadedPopularPage = noPagesLoaded
        self.lastLoadedTopRatedPage = noPagesLoaded
        self.lastLoadedNowPlayingPage = noPagesLoaded
    }
    
    func loadData() -> Observable<(nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?)>? {
        let imgConfig = client.getImagesConfiguration()
        let popular = client.getPopularMovies(pageOrdinal: 1)
        let topRated = client.getTopRatedMovies(pageOrdinal: 1)
        let nowPlaying = client.getNowPlayingMovies(pageOrdinal: 1)
        
        return Observable.zip(imgConfig, popular, topRated, nowPlaying) { imgConfig, popular, topRated, nowPlaying in
            (nowPlaying: nowPlaying, topRated: topRated, popular: popular)
        }
    }
    
    func loadNexPortion(_ movieType: MovieType) -> Observable<[Movie]?>? {
        switch movieType {
        case .nowPlaying:
            lastLoadedNowPlayingPage += 1
            return client.getNowPlayingMovies(pageOrdinal: lastLoadedNowPlayingPage)
        case .topRated:
            lastLoadedTopRatedPage += 1
            return client.getNowPlayingMovies(pageOrdinal: lastLoadedTopRatedPage)
        case .popular:
            lastLoadedPopularPage += 1
            return client.getNowPlayingMovies(pageOrdinal: lastLoadedPopularPage)
        }
    }
}
