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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DependencyContainer.container = {
            let container = Container()
            ClientModule.initModule(container: container)
            CoreModule.initModule(container: container)
            return container
        }()
        return true
    }
}

