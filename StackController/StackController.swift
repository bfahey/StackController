//
//  StackController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

// Before you change anything, read this: https://developer.apple.com/library/ios/technotes/tn2154/_index.html

public class StackController: UIViewController {
    
    public let scrollView = UIScrollView()
    
    public var layoutAnimationDuration: NSTimeInterval = 0.2

    @IBInspectable public var minimumSpacing: Float = 0.0

    var heightConstraints = [NSLayoutConstraint]()
    
    var didUpdateConstraints = false
    
    public var viewControllers = [UIViewController]() {
        willSet {
            viewControllers.forEach { removeViewController($0) }
            heightConstraints.removeAll()
        }
        didSet {
            viewControllers.forEach { addViewController($0) }
            view.setNeedsUpdateConstraints()
        }
    }
    
    public override func loadView() {
        super.loadView()
        
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.directionalLockEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        if #available(iOS 9.0, *) {
            view.topAnchor.constraintEqualToAnchor(scrollView.topAnchor).active = true
            view.bottomAnchor.constraintEqualToAnchor(scrollView.bottomAnchor).active = true
            view.leadingAnchor.constraintEqualToAnchor(scrollView.leadingAnchor).active = true
            view.trailingAnchor.constraintEqualToAnchor(scrollView.trailingAnchor).active = true
            
        } else {
            let views = ["scrollView": scrollView]
            
            view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|",
                    options: NSLayoutFormatOptions(),
                    metrics: nil,
                    views: views))
            
            view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|",
                    options: NSLayoutFormatOptions(),
                    metrics: nil,
                    views: views))
        }
    }

    public override func updateViewConstraints() {
        if didUpdateConstraints == false {
            
            var previousView: UIView?
        
            heightConstraints.removeAll()
            
            viewControllers.forEach { controller in
                let childView = controller.view
                
                view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[view(==child)]",
                    options: NSLayoutFormatOptions(), metrics: nil, views: ["child": childView, "view": view]))
                
                let heightConstraint = NSLayoutConstraint(item: childView, attribute: .Height, relatedBy: .Equal,
                    toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: CGRectGetHeight(childView.frame))

                childView.addConstraint(heightConstraint)
                
                heightConstraints.append(heightConstraint)
                
                if let previousView = previousView {
                    // Pin to previous view.
                    scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[previous]-spacing-[child]",
                        options: NSLayoutFormatOptions(),
                        metrics: ["spacing": NSNumber(float: minimumSpacing)],
                        views: ["child": childView, "previous": previousView]))
                    
                } else {
                    // Pin first view to top.
                    scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[child]",
                        options: NSLayoutFormatOptions(),
                        metrics: nil,
                        views: ["child": childView]))
                }
                
                previousView = childView
            }
            
            if let previousView = previousView {
                // Finally, pin to the bottom of the scroll view to determine content size.
                scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[previous]|",
                    options: NSLayoutFormatOptions(), metrics: nil, views: ["previous": previousView]))
            }
            
            didUpdateConstraints = true
        }
        super.updateViewConstraints()
    }
    
    public override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    // MARK: Private
    
    private func addViewController(viewController: UIViewController) {
        addChildViewController(viewController)
        
        let childView = viewController.view
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(childView)
        
        viewController.didMoveToParentViewController(self)
    }
    
    private func removeViewController(viewController: UIViewController) {
        viewController.willMoveToParentViewController(nil)
        
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParentViewController()
    }
    
    // MARK: - UIContentContainer
    
    public override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        super.sizeForChildContentContainer(container, withParentContainerSize: parentSize)
        
        return CGSize(width: parentSize.width, height: container.preferredContentSize.height)
    }
    
    public override func preferredContentSizeDidChangeForChildContentContainer(container: UIContentContainer) {
        super.preferredContentSizeDidChangeForChildContentContainer(container)

        if let controller = container as? UIViewController, let i = viewControllers.indexOf(controller) {
            guard i < heightConstraints.count else { return }
            
            let heightConstraint = heightConstraints[i]
            
            // Use the controller's `preferredContentSize` height value to set as our constant.
            heightConstraint.constant = container.preferredContentSize.height
            
            view.setNeedsUpdateConstraints()
            
            UIView.animateWithDuration(layoutAnimationDuration, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
