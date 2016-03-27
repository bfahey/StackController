//
//  ExampleStackViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit
import StackController

class ExampleStackViewController: StackController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadControllerWithIdentifier: (String) -> (UIViewController) = { identifier in
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(identifier)
        }
        
        let header = loadControllerWithIdentifier("Page")
        let corgi1 = loadControllerWithIdentifier("Collection")
        let corgi2 = loadControllerWithIdentifier("Collection")
        let corgi3 = loadControllerWithIdentifier("Collection")
        let footer = loadControllerWithIdentifier("Table")
        
        view.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        minimumSpacing = 1.0 / Float(UIScreen.mainScreen().scale)
        
        viewControllers = [header, corgi1, corgi2, corgi3, footer]
    }
}
