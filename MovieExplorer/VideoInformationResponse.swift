//
//  VideoInformationResponse.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoInformationResponse: Mappable {
    
    var videoInformations: [VideoInformation]?
    
    required init?(map: Map) {
        videoInformations <- map["results"]
    }
    
    func mapping(map: Map) {
    }
}
