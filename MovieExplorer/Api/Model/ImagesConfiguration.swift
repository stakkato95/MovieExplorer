//
//  ImagesConfiguration.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class ImagesConfiguration: Mappable {
    
    var baseUrl: String?
    
    var posterSizes: [String]?
    
    required init?(map: Map) {
        baseUrl <- map["base_url"]
        posterSizes <- map["poster_sizes"]
    }
    
    func mapping(map: Map) {
    }
}
