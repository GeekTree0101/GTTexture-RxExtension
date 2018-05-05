![alt text](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/logo.png)

[![CI Status](https://img.shields.io/travis/Geektree0101/GTTexture-RxExtension.svg?style=flat)](https://travis-ci.org/Geektree0101/GTTexture-RxExtension)
[![Version](https://img.shields.io/cocoapods/v/GTTexture-RxExtension.svg?style=flat)](https://cocoapods.org/pods/GTTexture-RxExtension)
[![License](https://img.shields.io/cocoapods/l/GTTexture-RxExtension.svg?style=flat)](https://cocoapods.org/pods/GTTexture-RxExtension)
[![Platform](https://img.shields.io/cocoapods/p/GTTexture-RxExtension.svg?style=flat)](https://cocoapods.org/pods/GTTexture-RxExtension)

## Concept
Texture provides various basic components such as ASTableNode, ASControlNode, ASButtonNode and so on.

ref: [Node Subclasses](http://texturegroup.org/docs/node-overview.html)

This library focused on ASControlNode to make convenience interactive wrappers on ASImageNode(UIImageView), ASNetworkImageNode(UIImageView), ASButtonNode and so on.

more see:
[Texture + RxSwift Interactive Wrapper](https://medium.com/@h2s1880/texture-rxswift-interactive-wrapper-d3c9843ed8d7)

## Example

- [ASButtonNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/ButtonTestNode.swift)

- [ASImageNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/ImageTestNode.swift)

- [ASNetworkImageNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/NetworkImageTestNode.swift)

- [ASTextNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/TextTestNode.swift)

- [ASScrollNode](https://github.com/ReactiveX/RxSwift/blob/master/RxCocoa/iOS/UIScrollView%2BRx.swift)

> you can access scrollNode wrapper from UIScrollView+Rx wrapper
```swift
let node = ASScrollNode()
node.view.rx // UIScrollView+Rx

```

- [ASEditableTextNode](https://github.com/ReactiveX/RxSwift/blob/master/RxCocoa/iOS/UITextView%2BRx.swift)

>you can access editableTableNode wrapper from UITextView+Rx wrapper
```swift
let node = ASEditableTextNode()
node.textView.rx // UITextView+Rx
```

## Installation

GTTexture-RxExtension is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GTTexture-RxExtension'
```

## Author

Geektree0101, h2s1880@gmail.com

## License

GTTexture-RxExtension is available under the MIT license. See the LICENSE file for more info