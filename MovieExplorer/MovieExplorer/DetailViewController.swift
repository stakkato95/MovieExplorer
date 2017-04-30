//
//  DetailViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 30.04.17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController, IDetailView {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var backgroundContainer: UIView!
    
    var p: IDetailPresenter?
    var presenter: IDetailPresenter {
        get {
            if p == nil {
                p = DependencyContainer.container.resolve(IDetailPresenter.self)!
                p?.setView(view: self)
            }
            
            return p!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
    }
    
    func showContent(movie: Movie, similarMovies: [Movie]?) {
        if let url = try? movie.posterPath.asURL() {
            backgroundImage.kf.setImage(with: url)
            image.kf.setImage(with: url)
        }
        
        applyBlurToBackground()
    }
    
    func showError(errorMessage: String) {
        
    }
    
    func setMovieInfo(movie: Movie) {
        presenter.setMovie(movie: movie)
    }
    
    private func applyBlurToBackground() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurVisualEffect = UIVisualEffectView(effect: blurEffect)
        blurVisualEffect.frame = backgroundContainer.frame
        backgroundContainer.addSubview(blurVisualEffect)
    }
}
