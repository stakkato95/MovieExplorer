//
//  IHomePresenter.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

class BasePresenter<TViewController: BaseViewControllerDelegate> {
    
    var delegate: BasePresenterDelegate?
    
    var viewController: TViewController
    
    init(viewController: TViewController) {
        self.viewController = viewController
    }
    
    func loadData() {
        print("loaded in base")
        delegate?.loadData()
    }
}
