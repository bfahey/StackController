//
//  UIImageView+ImageFromURL.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/27/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func imageFromURL(url: NSURL, completion: ((UIImage?) -> ())?)  {
        NSURLSession.sharedSession().dataTaskWithURL(url) { [unowned self] data, response, error in
        guard let data = data else {
            completion?(nil)
            return
        }
        
        let image = UIImage(data: data)
            
        dispatch_async(dispatch_get_main_queue(), { [unowned self] in
            self.image = image
        
            completion?(image)
        })
        
        }.resume()
    }
}
