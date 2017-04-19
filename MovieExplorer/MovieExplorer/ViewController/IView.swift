//
//  IViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation

protocol IView {
    
    associatedtype TPresenter
    
    func showError(errorMessage: String)
    
    var presenter: TPresenter { get }
}
