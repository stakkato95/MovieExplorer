//
//  ImageUrlComposer.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 29.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

class ImageUrlComposer: IImageUrlComposer {
    
    var imagesConfig: ImagesConfiguration?
    
    func setImagesConfig(_ imagesConfig: ImagesConfiguration) {
        self.imagesConfig = imagesConfig
    }
    
    func composeUrl(url: String) -> String? {
        guard imagesConfig != nil && imagesConfig?.baseUrl != nil && imagesConfig?.posterSizes != nil else {
            return nil
        }
        
        return imagesConfig!.baseUrl! + imagesConfig!.posterSizes![0] + url
    }
}
