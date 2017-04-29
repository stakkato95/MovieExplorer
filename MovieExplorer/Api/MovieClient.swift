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
    
    var imagesUrlComposer: IImageUrlComposer
    
    var isImagesConfigurtionRequested = false
    
    init(withApi api: IMovieApi,
         withApiKey apiKey: String,
         withYouTubeUrl youTubeBaseUrl: String,
         withUrlComposer imagesUrlComposer: IImageUrlComposer) {
        self.apiKey = apiKey
        self.youTubeBaseUrl = youTubeBaseUrl
        self.api = api
        self.imagesUrlComposer = imagesUrlComposer
    }
    
    func getImagesConfiguration() -> Observable<ImagesConfiguration?> {
        return api
            .getImagesConfiguration(apiKey: apiKey)
            .map { event in
                if let config = event?.imagesConfiguration {
                    self.imagesUrlComposer.setImagesConfig(config)
                }
                return event?.imagesConfiguration
        }
    }
    
    func getPopularMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        let moviesRequest = api
            .getPopularMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
        
        if !isImagesConfigurtionRequested {
            return requestImagesConfig(withMoviesRequest: moviesRequest)
        }
        
        return moviesRequest
    }
    
    func getTopRatedMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        let moviesRequest = api
            .getTopRatedMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
        
        if !isImagesConfigurtionRequested {
            return requestImagesConfig(withMoviesRequest: moviesRequest)
        }
        
        return moviesRequest
    }
    
    func getNowPlayingMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        let moviesRequest = api
            .getNowPlayingMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
        
        if !isImagesConfigurtionRequested {
            return requestImagesConfig(withMoviesRequest: moviesRequest)
        }
        
        return moviesRequest
    }
    
    private func requestImagesConfig(withMoviesRequest: Observable<[Movie]?>) -> Observable<[Movie]?> {
        isImagesConfigurtionRequested = true
        return Observable.zip(getImagesConfiguration(), withMoviesRequest)
            .map { imagesConfig, movies in
                self.isImagesConfigurtionRequested = true
                return movies
        }
    }
    
    private func processMovies(moviesResponse: MoviesResponse?) -> [Movie]? {
        guard var movies = moviesResponse?.movies else {
            return nil
        }
        
        self.composeImaeUrls(forMovies: &movies)
        
        return movies
    }
    
    private func composeImaeUrls(forMovies movies: inout [Movie]) {
        for movie in movies {
            movie.posterPath = self.imagesUrlComposer.composeUrl(url: movie.posterPath)
        }
    }
}
