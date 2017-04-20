//
//  ICell.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 20.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

protocol ICell {
    
    associatedtype TData
    
    func setData(data: TData)
}
