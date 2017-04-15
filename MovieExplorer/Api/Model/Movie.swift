//
//  File.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/15/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    
    var id: Int?

    var posterPath: String!
    
    var overview: String!
    
    var title: String!
    
    var releaseDate: String!
    
    var voteCount: Int!
    
    var averageVote: Double!
    
    var videoUrl: String?
    
    var isFavourite: Bool?
    
    required init?(map: Map) {
        id <- map["id"]
        posterPath <- map["poster_path"]
        overview <- map["overview"]
        title <- map["title"]
        releaseDate <- map["release_date"]
        voteCount <- map["vote_count"]
        averageVote <- map["vote_average"]
    }
    
    func mapping(map: Map) {
    }
}
