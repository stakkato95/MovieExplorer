//
//  UIViewExtension.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 29.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 6
    }
    
    func contentInsetBy(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
