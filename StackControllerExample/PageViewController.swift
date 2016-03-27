//
//  PageViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/26/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    private func updateContentSize() {
        preferredContentSize = CGSize(width: 0, height: 250.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 9.0, *) {
            let pageControl = UIPageControl.appearanceWhenContainedInInstancesOfClasses([PageViewController.self])
            pageControl.pageIndicatorTintColor = .lightGrayColor()
            pageControl.currentPageIndicatorTintColor = .blackColor()
        }
        
        view.backgroundColor = .whiteColor()
        
        dataSource = self
        
        if let firstController = viewControllerAtIndex(0) {
            setViewControllers([firstController], direction: .Forward, animated: false, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        updateContentSize()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition(nil) { [unowned self] context in
            self.updateContentSize()
        }
    }
    
    var images: [String] {
        return HelloImCallie.images
    }
    
    private func viewControllerAtIndex(index: Int) -> ImageViewController? {
        guard index >= 0 && index < images.count else { return nil }
        
        let imageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Image") as! ImageViewController
        imageVC.pageIndex = index
        imageVC.imageURLString = images[index]
        
        return imageVC
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let imageVC = viewController as? ImageViewController {
            var index = imageVC.pageIndex
            
            guard index != 0 || index != NSNotFound else { return nil }
            index -= 1
            
            return viewControllerAtIndex(index)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let imageVC = viewController as? ImageViewController {
            var index = imageVC.pageIndex
            
            guard index != NSNotFound else { return nil }
            index += 1
            guard index < images.count else { return nil }
            
            return viewControllerAtIndex(index)
        }
        return nil
    }
}
