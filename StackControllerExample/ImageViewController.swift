//
//  ImageViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

let corgi = "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/e35/11372127_527195077432544_1355637360_n.jpg?ig_cache_key=MTAzMDc5NTU5NTAxMTMzMjg2OA%3D%3D.2"

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: corgi)!
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { [unowned self] data, response, error in
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            
            dispatch_async(dispatch_get_main_queue(), { [unowned self] in
                self.imageView.image = image
                
                self.preferredContentSize = CGSize(width: 0, height: CGRectGetWidth(self.imageView.frame))
            })
        }.resume()
    }
}
