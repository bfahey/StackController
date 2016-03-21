//
//  ViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit
import StackController

class ViewController: StackController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let table = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Table")
        let image = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Image")
        let collection = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Collection")
        
        viewControllers = [image, table, collection]
        
//        performSelector("update", withObject: nil, afterDelay: 2.0)

        
//        let a = UIView()
//        a.backgroundColor = .cyanColor()
//        
//        let b = UIView()
//        b.backgroundColor = .greenColor()
//        
//        let c = UIView()
//        c.backgroundColor = .blueColor()
//
//        var views = [UILabel]()
//        for i in 0...50 {
//            let label = UILabel()
//            label.text = "\(i)"
//            views.append(label)
//        }
//        
//        self.views = views
    }

    func update() {
        let table = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Table")
        let image = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Image")
        
        viewControllers = [image, table]
    }
}

