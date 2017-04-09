//
//  ViewController.swift
//  MovieExplorer
//
//  Created by Artsiom Kaliaha on 4/9/17.
//  Copyright © 2017 Artsiom Kaliaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var function: (Int) -> Int = {
        (input: Int) -> Int in
        print("")
        print("hello")
        let constant = 5
        var finalResult = constant + 10 + input
        return finalResult
    }
    
    var isUserTypingText = false
    
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var num = 5
        
        var closure = { self.button.currentTitle }
        
        print(String(closure()!)!)
        
        func callMe(closu: () -> Void) {
            print(num)
            closu()
        }
        
        callMe() {
            print("called")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        //        print("it was called");
        //        print("it was called")
        //
        //        let button = UIButton()
        //        button.setTitle("text", for: UIControlState.normal)
        //        var text = button.currentTitle
        //        text?.append("a")
        //
        //        if text != nil {
        //            text?.append("b")
        //        }
        //
        //        print("awesome \(text ?? "not set") label")
        //
        //        var textOne: String? = nil
        //        if textOne != nil {
        //            textOne?.append("a")
        //        }
        //
        //        if let textTwo = UIButton().currentTitle {
        //            print(textTwo)
        //        }
        
        writeText(from: 12, to: 14)
    }
    
    func writeText(from val: Int, to path: Int) -> Int {
        return 1;
    }
}

