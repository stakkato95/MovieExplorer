//
//  IDetailUseCase.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift

protocol IDetailUseCase {
    
    func loadData(movieId: Int) -> Observable<[Movie]?>
}
