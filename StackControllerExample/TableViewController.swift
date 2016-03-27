//
//  TableViewController.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/20/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private func updateContentSize() {
        preferredContentSize = tableView.rectForSection(0).size
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        HelloImCallie.openInSafari()
    }
}
