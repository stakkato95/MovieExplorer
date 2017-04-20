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
        
        nowPlayingCollection.register(
            UINib(nibName: MovieCell.nibName, bundle: nil),
            forCellWithReuseIdentifier: MovieCell.cellId
        )
        
        topRatedCollection.register(
            UINib(nibName: MovieCell.nibName, bundle: nil),
            forCellWithReuseIdentifier: MovieCell.cellId
        )
        
        popularCollection.register(
            UINib(nibName: MovieCell.nibName, bundle: nil),
            forCellWithReuseIdentifier: MovieCell.cellId
        )
        
        presenter.loadData()
    }
    
    
    func showError(errorMessage: String) {
        print("error shown")
    }
    
    func showMovies(moviesCollection: (nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?)) {
        let nowPlayingMovies = moviesCollection.nowPlaying
        if nowPlayingMovies != nil {
            let nowPlayingDelegate = CollectionViewDelegate<Movie, MovieCell>(
                withData: nowPlayingMovies!,
                onItemSelectionListener: { movie in
                    
            }, cellId: MovieCell.cellId)
            nowPlayingCollection.dataSource = nowPlayingDelegate
            nowPlayingCollection.delegate = nowPlayingDelegate
        }
        
        let topRatedMovies = moviesCollection.topRated
        if topRatedMovies != nil {
            let topRatedDelegate = CollectionViewDelegate<Movie, MovieCell>(
                withData: topRatedMovies!,
                onItemSelectionListener: { movie in
                    
            }, cellId: MovieCell.cellId)
            topRatedCollection.dataSource = topRatedDelegate
            topRatedCollection.delegate = topRatedDelegate
        }
        
        let popularMovies = moviesCollection.popular
        if popularMovies != nil {
            let popularDelegate = CollectionViewDelegate<Movie, MovieCell>(
                withData: popularMovies!,
                onItemSelectionListener: { movie in
                    
            }, cellId: MovieCell.cellId)
            popularCollection.dataSource = popularDelegate
            popularCollection.delegate = popularDelegate
        }
    }
}
