//
//  DetailUseCase.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

class DetailUseCase: IDetailUseCase {
    
    var client: IMovieClient
    
    init(client: IMovieClient) {
        self.client = client
    }
    
    func loadData(movieId: Int) -> Observable<[Movie]?> {
        return client.getSimilarMovies(movieId: movieId);
    }
}
