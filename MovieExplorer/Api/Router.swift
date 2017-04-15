//
//  Router.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/14/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
    
    case getImagesConfiguration(apiKey: String)
    
    case getNowPlayingMovies(pageOrdinal: Int, apiKey: String)
    
    case getTopRatedMovies(pageOrdinal: Int, apiKey: String)
    
    case getPopularMovies(pageOrdinal: Int, apiKey: String)
    
    case getSimilarMovies(movieId: Int, apiKey: String)
    
    case getMovieVideoInformation(movieId: Int, apiKey: String)
    
    case getMovieDetails(movieId: Int, apiKey: String)
    
    static let baseUrl = "http://api.themoviedb.org/3"
    
    var path: String {
        switch self {
        case .getImagesConfiguration:
            return "\(Router.baseUrl)/configuration"
        case .getNowPlayingMovies:
            return "\(Router.baseUrl)/movie/now_playing"
        case .getTopRatedMovies:
            return "\(Router.baseUrl)/movie/top_rated"
        case .getPopularMovies:
            return "\(Router.baseUrl)/movie/popular"
        case let .getSimilarMovies(movieId, _):
            return "\(Router.baseUrl)/movie/\(movieId)/similar"
        case let .getMovieVideoInformation(movieId, _):
            return "\(Router.baseUrl)/movie/\(movieId)/videos"
        case let .getMovieDetails(movieId, _):
            return "\(Router.baseUrl)/movie/\(movieId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImagesConfiguration,
             .getNowPlayingMovies,
             .getTopRatedMovies,
             .getPopularMovies,
             .getSimilarMovies,
             .getMovieVideoInformation,
             .getMovieDetails:
            return HTTPMethod.get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case let .getImagesConfiguration(apiKey):
            return [
                "apiKey" : apiKey
            ]
        case let .getNowPlayingMovies(pageOrdinal, apiKey):
            return [
                "apiKey" : apiKey,
                "page" : pageOrdinal,
                "sort_by" : "popularity.des"
            ]
        case let .getTopRatedMovies(pageOrdinal, apiKey):
            return [
                "apiKey" : apiKey,
                "page" : pageOrdinal,
                "sort_by" : "popularity.des"
            ]
        case let .getPopularMovies(pageOrdinal, apiKey):
            return [
                "apiKey" : apiKey,
                "page" : pageOrdinal,
                "sort_by" : "popularity.des"
            ]
        case let .getSimilarMovies(_, apiKey):
            return [
                "apiKey" : apiKey
            ]
        case let .getMovieVideoInformation(_, apiKey):
            return [
                "apiKey" : apiKey
            ]
        case let .getMovieDetails(_, apiKey):
            return [
                "apiKey" : apiKey
            ]
        }
    }
}
