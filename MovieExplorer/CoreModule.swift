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
            MoviesUseCase(client: resolver.resolve(IMovieClient.self)!)
        }
        
        container.register(IDetailUseCase.self) { resolver in
            DetailUseCase(client: resolver.resolve(IMovieClient.self)!)
        }
        
        container.register(IMoviePresenter.self) { resolver in
            MoviesPresenter<MoviesViewController>(moviesUseCase: resolver.resolve(IMoviesUaseCase.self)!)
        }
        
        container.register(IDetailPresenter.self) { resolver in
            DetailPresenter(detailUseCase: resolver.resolve(IDetailUseCase.self)!)
        }
    }
}
