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
    
    @IBOutlet var similarMoviesCollection: UICollectionView!
    
    @IBOutlet var progressContainer: UIView!
    
    @IBOutlet var movieTitle: UILabel!
    
    @IBOutlet var movieReleaseDate: UILabel!
    
    @IBOutlet var movieDescription: UILabel!
    
    @IBAction func playVideo() {
        
    }
    
    var similarMoviesDelegate: CollectionViewDelegate<Movie, MovieCell>?
    
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
        
        let nib = UINib(nibName: MovieCell.nibName, bundle: nil)
        similarMoviesCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        similarMoviesCollection.addShadow()
        similarMoviesCollection.contentInsetBy(top: 0, left: 12, bottom: 0, right: 12)
        
        similarMoviesDelegate = CollectionViewDelegate<Movie, MovieCell>(cellId: MovieCell.cellId)
        similarMoviesCollection.delegate = similarMoviesDelegate
        similarMoviesCollection.dataSource = similarMoviesDelegate
        
        presenter.loadData()
    }
    
    func showContent(movie: Movie, similarMovies: [Movie]?) {
        if let url = try? movie.posterPath.asURL() {
            backgroundImage.kf.setImage(with: url)
            image.kf.setImage(with: url)
        }
        applyBlurToBackground()
        
        movieTitle.text = movie.title
        movieReleaseDate.text = "Release Date: \(movie.releaseDate)"
        movieDescription.text = movie.overview
        
        similarMoviesDelegate!.setData(similarMovies)
        similarMoviesCollection.reloadData()
        
        progressContainer.isHidden = true
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
