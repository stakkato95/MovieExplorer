//
//  Router.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/14/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getImagesConfiguration(apiKey: String)
    
    case getNowPlayingMovies(pageOrdingal: Int, apiKey: String)
    
    case getTopRatedMovies(pageOrdinal: Int, apiKey: String)
    
    case getPopularMovies(pageOrdinal: Int, apiKey: String)
    
    case getSimilarMovies(movieId: Int, apiKey: String)
    
    case getMovieVideoInformation(movieId: Int, apiKey: String)
    
    case getMovieDetails(movieId: Int, apiKey: String)
    
    static let baseUrl = "http://api.themoviedb.org/3"
    
    func asURLRequest() throws -> URLRequest {
        let result: (method: HTTPMethod, path: String, parameters: Parameters)? = {
            switch self {
            case let .getImagesConfiguration(apiKey) :
                return (
                    HTTPMethod.get,
                    "/configuration",
                    ["apiKey" : apiKey ]
                )
            case let .getNowPlayingMovies(pageOrdinal, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/now_playing",
                    [ "apiKey" : apiKey, "page" : pageOrdinal, "sort_by" : "popularity.des" ]
                )
            case let .getTopRatedMovies(pageOrdinal, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/top_rated",
                    [ "apiKey" : apiKey, "page" : pageOrdinal, "sort_by" : "popularity.des" ]
                )
            case let .getPopularMovies(pageOrdinal, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/popular",
                    [ "apiKey" : apiKey, "page" : pageOrdinal, "sort_by" : "popularity.des" ]
                )
            case let .getSimilarMovies(movieId, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/\(movieId)/similar",
                    [ "apiKey" : apiKey ]
                )
            case let .getMovieVideoInformation(movieId, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/\(movieId)/videos",
                    [ "apiKey" : apiKey ]
                )
            case let .getMovieDetails(movieId, apiKey):
                return (
                    HTTPMethod.get,
                    "/movie/\(movieId)",
                    [ "apiKey" : apiKey ]
                )
            }
        }()
        
        let url = try Router.baseUrl.asURL()
        let urlRequest = try URLRequest(url: url.appendingPathComponent(result!.path), method: result!.method)
        
        return try URLEncoding.default.encode(urlRequest, with: result!.parameters)
    }
}
