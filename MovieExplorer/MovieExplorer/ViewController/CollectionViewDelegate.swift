//
//  CollectionViewDelegate.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 20.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDelegate<TData, TCellType: ICell>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var data: [TData]?
    
    var onItemSelected: (TData) -> Void
    
    var cellId: String
    
    init(cellId: String, onItemSelectionListener onItemSelected: @escaping (TData) -> Void) {
        self.onItemSelected = onItemSelected
        self.cellId = cellId
    }
    
    func setData(_ data: [TData]?) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        (cell as! TCellType).setData(data: data![indexPath.item] as! TCellType.TData)
        
        return cell
    }
    
    func collectionView(_: UICollectionView, didSelectItemAt: IndexPath) {
        onItemSelected(data![didSelectItemAt.item])
    }
}
