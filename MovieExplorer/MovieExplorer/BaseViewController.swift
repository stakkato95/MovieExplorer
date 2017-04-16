//
//  ViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/9/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import UIKit
import Alamofire

class BaseViewController<TPresenter: BasePresenterDelegate>: UIViewController {
    
    var delegate: BaseViewControllerDelegate?
    
    var presenter: TPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = delegate?.getPresenter() as? TPresenter
        presenter?.loadData()
    }
}
