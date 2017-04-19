//
//  CoreModule.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import Swinject

class CoreModule {
    
    static func initModule(container: Container) {
        container.register(IMoviesUaseCase.self) { resolver in
            return MoviesUseCase(client: resolver.resolve(IMovieClient.self)!)
        }
        
        container.register(IMoviePresenter.self) { resolver in
            return MoviesPresenter<MoviesViewController>(moviesUseCase: resolver.resolve(IMoviesUaseCase.self)!)
        }
    }
}
