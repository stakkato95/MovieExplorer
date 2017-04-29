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
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        
        DependencyContainer.container = {
            let container = Container()
            ClientModule.initModule(container: container)
            CoreModule.initModule(container: container)
            return container
        }()
        
        DependencyContainer.container.resolve(IMovieClient.self)?
            .getImagesConfiguration()
            .subscribe(onNext: { imagesConfig in
                print("DONE")
            }, onError: { error in
                print("ERROR")
            })
        
        return true
    }
}

