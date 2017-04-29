//
//  IImageUrlComposer.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 29.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

protocol IImageUrlComposer {
    
    func setImagesConfig(_ imagesConfig: ImagesConfiguration)
    
    func composeUrl(url: String) -> String?
}
