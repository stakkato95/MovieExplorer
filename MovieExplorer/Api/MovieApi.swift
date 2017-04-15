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

class MovieApi {
    
    func getImagesConfiguration(apiKey: String) throws -> Observable<ImagesConfigurationResponse?> {
        let requestParameters = Router.getImagesConfiguration(apiKey: apiKey)
        
        guard let observable = try performRequest(requestParameters, typeOfResponse: ImagesConfigurationResponse.self) else {
            throw RequestError.requestFailed
        }
        
        return observable
    }
    
    func getMovieDetails(apiKey: String, pageOrdinal: Int) throws -> Observable<Movie?> {
        let requestParameters = Router.getPopularMovies(pageOrdinal: pageOrdinal, apiKey: apiKey)
        
        guard let observable = try performRequest(requestParameters, typeOfResponse: Movie.self) else {
            throw RequestError.requestFailed
        }
        
        return observable
    }
    
    func performRequest<TMappable: Mappable>(_ request: Router, typeOfResponse: TMappable.Type) throws -> Observable<TMappable?>? {
        return RxAlamofire.requestJSON(request.method, try request.path.asURL(), parameters: request.parameters).map { event in
            return TMappable(JSONString: String())
        }
    }
}
