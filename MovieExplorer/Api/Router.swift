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
    
    static let baseUrl = "https://api.themoviedb.org/3"
    
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
    
    var parameters: [String: String] {
        switch self {
        case let .getImagesConfiguration(apiKey):
            return getApiKeyParameters(apiKey)
            
        case let .getNowPlayingMovies(pageOrdinal, apiKey):
            var parameters = getApiKeyParameters(apiKey)
            parameters["page"] = String(pageOrdinal)
            parameters["sort_by"] = "popularity.des"
            return parameters
            
        case let .getTopRatedMovies(pageOrdinal, apiKey):
            var parameters = getApiKeyParameters(apiKey)
            parameters["page"] = String(pageOrdinal)
            parameters["sort_by"] = "popularity.des"
            return parameters
            
        case let .getPopularMovies(pageOrdinal, apiKey):
            var parameters = getApiKeyParameters(apiKey)
            parameters["page"] = String(pageOrdinal)
            parameters["sort_by"] = "popularity.des"
            return parameters
            
        case let .getSimilarMovies(_, apiKey):
            return getApiKeyParameters(apiKey)
            
        case let .getMovieVideoInformation(_, apiKey):
            return getApiKeyParameters(apiKey)
            
        case let .getMovieDetails(_, apiKey):
            return getApiKeyParameters(apiKey)
        }
    }
    
    func getApiKeyParameters(_ apiKey: String) -> [String: String] {
        return [ "api_key" : apiKey ]
    }
}
