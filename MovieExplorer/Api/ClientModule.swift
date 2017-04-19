//
//  ClientModule.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import Swinject

class ClientModule {
    
    static let apiKey = "ab41356b33d100ec61e6c098ecc92140"
    
    static let youTubeBaseUrl = "https://www.youtube.com/watch?v="
    
    static func initModule(container: Container) {
        container.register(IMovieApi.self) { _ in MovieApi() }.inObjectScope(.container);
        
        container.register(IMovieClient.self) { resolver in
            MovieClient(withApi: resolver.resolve(IMovieApi.self)!,
                        withApiKey: apiKey,
                        withYouTubeUrl: youTubeBaseUrl)
        }.inObjectScope(.container);
    }
}
