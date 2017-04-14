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
    
    case getSimilarMovies(pageOrdinal: Int, apiKey: String)
    
    case getMovieVideoInformation(movieId: Int, apiKey: String)
    
    case getMovieDetails(movieId: Int, apiKey: String)
    
    static let baseUrl = "http://api.themoviedb.org/3"
    
    func asURLRequest() throws -> URLRequest {
        let result: (method: HTTPMethod, path: String, parameters: Parameters)? = {
            switch self {
            case let .getImagesConfiguration(apiKey) :
                return (method: HTTPMethod.get, "/configuration", ["apiKey" : apiKey ])
            default:
                return nil
            }
        }()
        
        let url = try Router.baseUrl.asURL()
        let urlRequest = try URLRequest(url: url.appendingPathComponent(result!.path), method: result!.method)
        
        return try URLEncoding.default.encode(urlRequest, with: result!.parameters)
    }
}
