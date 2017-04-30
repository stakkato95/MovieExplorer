//
//  MoviesViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/16/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class MoviesViewController: UIViewController, IMoviesView {
    
    @IBOutlet var nowPlayingCollection: UICollectionView!
    
    @IBOutlet var topRatedCollection: UICollectionView!
    
    @IBOutlet var popularCollection: UICollectionView!
    
    @IBOutlet var progressContainer: UIView!
    
    static let detailSegueId = "movieDetail"
    
    var nowPlayingDelegate: CollectionViewDelegate<Movie, MovieCell>!
    
    var topRatedDelegate: CollectionViewDelegate<Movie, MovieCell>!
    
    var popularDelegate: CollectionViewDelegate<Movie, MovieCell>!
    
    var p: IMoviePresenter!
    var presenter: IMoviePresenter {
        get {
            if p == nil {
                p = DependencyContainer.container.resolve(IMoviePresenter.self)!
                p.setView(view: self)
            }
            return p
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nowPlayingCollection.addShadow()
        topRatedCollection.addShadow()
        popularCollection.addShadow()
        
        nowPlayingCollection.contentInsetBy(top: 10, left: 12, bottom: 10, right: 12)
        topRatedCollection.contentInsetBy(top: 10, left: 12, bottom: 10, right: 12)
        popularCollection.contentInsetBy(top: 10, left: 12, bottom: 10, right: 12)
        
        let nib = UINib(nibName: MovieCell.nibName, bundle: nil)
        nowPlayingCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        topRatedCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        popularCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        
        let movieClick: (Movie) -> Void = { movie in
            self.performSegue(withIdentifier: MoviesViewController.detailSegueId, sender: movie)
        }
        
        nowPlayingDelegate = CollectionViewDelegate<Movie, MovieCell>(
            cellId: MovieCell.cellId,
            onItemSelectionListener: movieClick
        )
        nowPlayingCollection.dataSource = nowPlayingDelegate
        nowPlayingCollection.delegate = nowPlayingDelegate
        
        topRatedDelegate = CollectionViewDelegate<Movie, MovieCell>(
            cellId: MovieCell.cellId,
            onItemSelectionListener: movieClick
        )
        topRatedCollection.dataSource = topRatedDelegate
        topRatedCollection.delegate = topRatedDelegate
        
        popularDelegate = CollectionViewDelegate<Movie, MovieCell>(
            cellId: MovieCell.cellId,
            onItemSelectionListener: movieClick
        )
        popularCollection.dataSource = popularDelegate
        popularCollection.delegate = popularDelegate
        
        presenter.loadData()
    }
    
    
    func showError(errorMessage: String) {
        print("error shown")
    }
    
    func showMovies(moviesCollection: (nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?)) {
//        performSegue(withIdentifier: "movieDetail", sender: self)
        
        progressContainer.isHidden = true
        
        nowPlayingDelegate.setData(moviesCollection.nowPlaying)
        nowPlayingCollection.reloadData()
        
        topRatedDelegate.setData(moviesCollection.topRated)
        topRatedCollection.reloadData()
        
        popularDelegate.setData(moviesCollection.popular)
        popularCollection.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MoviesViewController.detailSegueId {
            let target = segue.destination as! DetailViewController
            target.setMovieInfo(movie: sender as! Movie)
        }
    }
}
