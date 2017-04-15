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

class MovieClient {
    
    let apiKey: String
    
    let youTubeBaseUrl: String
    
    let api: MovieApi
    
    init(api: MovieApi, apiKey: String, youTubeBaseUrl: String) {
        self.apiKey = apiKey
        self.youTubeBaseUrl = youTubeBaseUrl
        self.api = api
    }
    
    func getImagesConfiguration() throws -> Observable<ImagesConfiguration?>?  {
        return try api.getImagesConfiguration(apiKey: apiKey).map { event in
            return ImagesConfiguration(JSONString: String())
        }
    }
}
