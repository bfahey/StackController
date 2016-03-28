[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/bfahey/StackController/blob/master/LICENSE)

# StackController
A vertically scrolling container view controller written in Swift.

## Usage

### Preferred Content Size

The only requirement when using a stack controller is that you keep your view controller's `preferredContentSize` up-to-date. Typically, the value of the `preferredContentSize` property is used when displaying a view controller's content in a popover. However, container controllers also use this property to layout their child view controllers.

```swift
override func viewDidAppear(animated: Bool) {
super.viewDidAppear(animated)

preferredContentSize = tableView.rectForSection(0).size
}
```

It's best to update `preferredContentSize` in `viewDidAppear:` to allow the view controller to fully layout its subviews.

### Supporting Rotation

A stack controller will immediately respond to any changes in its child view controller's `preferredContentSize`.

```swift
private func updateContentSize() {
preferredContentSize = collectionView!.contentSize
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
```


## Known Issues
When using a `UITableView` or `UICollectionView` in a stack controller they will not benefit from cell reuse. The stack controller's scroll view does not forward its content offset to any subviews. It simply "wastes" memory by drawing all the cells so be sure to limit your cell count and monitor memory usage. For more information, read Ole Begemann's post, [*Scroll Views Inside Scroll Views*](http://oleb.net/blog/2014/05/scrollviews-inside-scrollviews/).

## Installation

To integrate StackController into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), add it to your `Cartfile`:

github "bfahey/StackController"
