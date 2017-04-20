//
//  MovieCell.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell, ICell {
    
    typealias TData = Movie
    
    static let cellId = "cell"
    
    static let nibName = "MovieCellView"
    
    @IBOutlet var image: UIImageView!
    
    func setData(data: TData) {
//        image.loadImage
    }
}
