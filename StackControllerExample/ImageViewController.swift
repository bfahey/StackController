//
//  ImageViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var imageURLString: String?
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = imageURLString, let url = NSURL(string: urlString) {
            imageView.imageFromURL(url, completion: nil)
        }
    }
}
