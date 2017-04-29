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

class MoviesViewController: UIViewController, IMoviesView, UICollectionViewDataSource {
    
    @IBOutlet var nowPlayingCollection: UICollectionView!
    
    @IBOutlet var topRatedCollection: UICollectionView!
    
    @IBOutlet var popularCollection: UICollectionView!
    
    
    
    
    
    
    
    var data: [Movie]?
    
    
    
    
    
    
    
    
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
        
        let nib = UINib(nibName: MovieCell.nibName, bundle: nil)
        
//        nowPlayingCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        
        
        
        
        
        
        
        
        nowPlayingCollection.dataSource = self
        
        
        
        
        
        
        
        
        topRatedCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        
        popularCollection.register(nib, forCellWithReuseIdentifier: MovieCell.cellId)
        
        presenter.loadData()
    }
    
    
    func showError(errorMessage: String) {
        print("error shown")
    }
    
    func showMovies(moviesCollection: (nowPlaying: [Movie]?, topRated: [Movie]?, popular: [Movie]?)) {
        DispatchQueue.main.async() {
            self.data = moviesCollection.nowPlaying
            self.nowPlayingCollection.reloadData()
            
            
//            if let nowPlayingMovies = moviesCollection.nowPlaying {
//                let nowPlayingDelegate = CollectionViewDelegate<Movie, MovieCell>(
//                    withData: nowPlayingMovies,
//                    onItemSelectionListener: { movie in
//                        
//                }, cellId: MovieCell.cellId)
//                self.nowPlayingCollection.dataSource = nowPlayingDelegate
////                self.nowPlayingCollection.delegate = nowPlayingDelegate
//                self.nowPlayingCollection.reloadData()
//            }
            
//            if let topRatedMovies = moviesCollection.topRated {
//                let topRatedDelegate = CollectionViewDelegate<Movie, MovieCell>(
//                    withData: topRatedMovies,
//                    onItemSelectionListener: { movie in
//                        
//                }, cellId: MovieCell.cellId)
////                self.topRatedCollection.dataSource = topRatedDelegate
//                self.topRatedCollection.delegate = topRatedDelegate
//                self.topRatedCollection.reloadData()
//            }
//            
//            if let popularMovies = moviesCollection.popular {
//                let popularDelegate = CollectionViewDelegate<Movie, MovieCell>(
//                    withData: popularMovies,
//                    onItemSelectionListener: { movie in
//                        
//                }, cellId: MovieCell.cellId)
//                self.popularCollection.dataSource = popularDelegate
//                self.popularCollection.delegate = popularDelegate
//                self.popularCollection.reloadData()
//            }
        }
    }
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.cellId, for: indexPath)
        
        (cell as! MovieCell).setData(data: data![indexPath.item])
        
        return cell
    }
}
