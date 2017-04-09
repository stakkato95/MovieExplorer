//
//  StaticTest.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/9/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import Foundation


class Stat {
    
    var function: (Stat) -> (Int, Int) -> Int = callMe
    
    func callMe(to: Int, from: Int) -> Int {
        return 1
    }
}
