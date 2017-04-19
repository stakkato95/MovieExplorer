//
//  ImageConfigurationResponse.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class ImagesConfigurationResponse: Mappable {
    
    var imagesConfiguration: ImagesConfiguration?
    
    required init?(map: Map) {
        imagesConfiguration <- map["images"]
    }
    
    func mapping(map: Map) {
    }
}
