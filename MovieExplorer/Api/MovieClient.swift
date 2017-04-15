//
//  MovieApi.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/14/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class MovieClient {
    
    let apiKey: String
    
    let youTubeBaseUrl: String
    
    init(apiKey: String, youTubeBaseUrl: String) {
        self.apiKey = apiKey
        self.youTubeBaseUrl = youTubeBaseUrl
    }
    
    func getImagesConfiguration() {
        Alamofire.request(Router.getImagesConfiguration(apiKey: apiKey)).responseJSON { response in
//            response.result
        }
    }
}
