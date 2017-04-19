//
//  VideoInformation.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoInformation: Mappable {
    
    var videoPath: String?
    
    var site: String?
    
    required init?(map: Map) {
        videoPath <- map["key"]
        site <- map["site"]
    }
    
    func mapping(map: Map) {
    }
}
