//
//  MovieCell.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/19/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell, ICell {
    
    typealias TData = Movie
    
    static let cellId = "cell"
    
    static let nibName = "MovieCellView"
    
    @IBOutlet var image: UIImageView!
    
    func setData(data: TData) {
        if let url = try? data.posterPath.asURL() {
            image.kf.setImage(with: url)
        }
    }
}
