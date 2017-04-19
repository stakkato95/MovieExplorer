//
//  MovieApi.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift
import ObjectMapper

class MovieApi: IMovieApi {
    
    func getImagesConfiguration(apiKey: String) -> Observable<ImagesConfigurationResponse?> {
        let requestParameters = Router.getImagesConfiguration(apiKey: apiKey)
        return performRequest(requestParameters, typeOfResponse: ImagesConfigurationResponse.self)
    }
    
    func getPopularMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?> {
        let requestParameters = Router.getPopularMovies(pageOrdinal: pageOrdinal, apiKey: apiKey)
        return performRequest(requestParameters, typeOfResponse: MoviesResponse.self)
    }
    
    func getTopRatedMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?> {
        let requestParameters = Router.getTopRatedMovies(pageOrdinal: pageOrdinal, apiKey: apiKey)
        return performRequest(requestParameters, typeOfResponse: MoviesResponse.self)
    }
    
    func getNowPlayingMovies(apiKey: String, pageOrdinal: Int) -> Observable<MoviesResponse?> {
        let requestParameters = Router.getNowPlayingMovies(pageOrdinal: pageOrdinal, apiKey: apiKey)
        return performRequest(requestParameters, typeOfResponse: MoviesResponse.self)
    }
    
    private func performRequest<TMappable: Mappable>(_ request: Router, typeOfResponse: TMappable.Type) -> Observable<TMappable?> {
        return RxAlamofire.requestString(request.method, try! request.path.asURL(), parameters: request.parameters).map { event in
            guard event.0.statusCode == 200 else {
                throw ApiError.requestFailed
            }
            
            return TMappable(JSONString: event.1)
        }
    }
}
