//
//  AppDelegate.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit
import StackController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let nav = window?.rootViewController as! UINavigationController,
          stack = nav.viewControllers.first as! StackController
        
        let loadControllerWithIdentifier: (String) -> (UIViewController) = { identifier in
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(identifier)
        }
        
        let header = loadControllerWithIdentifier("Page")
        let corgi1 = loadControllerWithIdentifier("Collection")
        let corgi2 = loadControllerWithIdentifier("Collection")
        let footer = loadControllerWithIdentifier("Table")
        
        stack.view.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        stack.minimumSpacing = 1.0 / Float(UIScreen.mainScreen().scale)
        stack.viewControllers = [header, corgi1, corgi2, footer]
        
        return true
    }
}
