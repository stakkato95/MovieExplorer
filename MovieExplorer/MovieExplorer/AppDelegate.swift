//
//  AppDelegate.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/9/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import UIKit
import CoreData
import RxSwift
import RxAlamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let client = MovieClient(api: MovieApi(), apiKey: "ab41356b33d100ec61e6c098ecc92140", youTubeBaseUrl: "")
        
        MoviesUseCase(client: client)
            .loadData()?
            .observeOn(MainScheduler.instance)
            .subscribeOn(CurrentThreadScheduler.instance)
            .subscribe(onNext: { result in
                print(result.nowPlaying?.count as Any)
            }, onError: { error in
                print("")
            }, onCompleted: {
                print("completed")
            })
        return true
    }
}

