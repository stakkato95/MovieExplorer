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
        return api
            .getPopularMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
    }
    
    func getTopRatedMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        return api
            .getTopRatedMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
    }
    
    func getNowPlayingMovies(pageOrdinal: Int) -> Observable<[Movie]?> {
        return api
            .getNowPlayingMovies(apiKey: apiKey, pageOrdinal: pageOrdinal)
            .map { event in self.processMovies(moviesResponse: event) }
    }
    
    private func processMovies(moviesResponse: MoviesResponse?) -> [Movie]? {
        guard var movies = moviesResponse?.movies else {
            return nil
        }
        
        composeImageUrls(forMovies: &movies)
        
        return movies
    }
    
    private func composeImageUrls(forMovies movies: inout [Movie]) {
        for movie in movies {
            movie.posterPath = self.imagesUrlComposer.composeUrl(url: movie.posterPath)
        }
    }
}
