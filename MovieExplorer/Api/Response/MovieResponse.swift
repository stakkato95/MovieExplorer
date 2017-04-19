//
//  MovieResponse.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesResponse: Mappable {
    
    var movies: [Movie]?
    
    
    required init?(map: Map) {
        movies <- map["results"]
    }
    
    func mapping(map: Map) {
    }
}
