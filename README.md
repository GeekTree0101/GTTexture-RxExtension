![alt text](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/logo.png)

[![CI Status](https://img.shields.io/travis/Geektree0101/GTTexture-RxExtension.svg?style=flat)](https://travis-ci.org/GeekTree0101/GTTexture-RxExtension)
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

#### Extension

- [ASButtonNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/ButtonTestNode.swift)

- [ASImageNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/ImageTestNode.swift)

- [ASNetworkImageNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/NetworkImageTestNode.swift)


- [ASTextNode RxExtension Example](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/TextTestNode.swift)

- [ASScrollNode](https://github.com/ReactiveX/RxSwift/blob/master/RxCocoa/iOS/UIScrollView%2BRx.swift)

#### ASBinder
: Subscribed Observer operates asynchronously.

<table>
  <tr>
    <td align="center">Expectation Flow</td>
    <td align="center">Expectation UI</td>
  </tr>
  <tr>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/expect.png"></th>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/expect2.png"></th>
  </tr>
</table>

But, Node dosen't know that event value applied on UI before draw.

<table>
  <tr>
    <td align="center">Unexpectation Flow</td>
    <td align="center">Unexpectation UI</td>
  </tr>
  <tr>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/badcase.png"></th>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/badcase2.png"></th>
  </tr>
</table>

In this case, Node should use setNeedsLayout. but, [bind:_] doesn't call setNeedsLayout automatically.

Normally, you can use like this code

```swift
// Profile NetworkImage Node is default
// username, description is Optional

// *** self is usernameNode supernode
viewModel.username
         .subscribe(onNext: { [weak self] text in 
            self?.usernameNode.rx.text(Node.usernameAttributes).onNext(text)
            self?.setNeedsLayout() // Here
         })
         .disposed(by: disposeBag)
```

If you use ASBinder then you don't need call setNeedsLayout. ASBinder will operates it automatically.

```swift
// Profile NetworkImage Node is default
// username, description is Optional

// *** self is usernameNode supernode
viewModel.username
         .bind(to: usernameNode.rx.text(Node.usernameAttributes),
               setNeedsLayout: self) 
         .disposed(by: disposeBag)

// *** self is descriptionNode supernode
viewModel.desc
         .bind(to: descriptionNode.rx.text(Node.descAttributes),
               setNeedsLayout: self) 
         .disposed(by: disposeBag)
```

If you don't need setNeedsLayout then just write code like this.


```swift
// setNeedsLayout default is nil!
viewModel.username
         .bind(to: usernameNode.rx.text(Node.usernameAttributes) 
         .disposed(by: disposeBag)

viewModel.desc
         .bind(to: descriptionNode.rx.text(Node.descAttributes)) 
         .disposed(by: disposeBag)
```

<table>
  <tr>
    <td align="center">ASBinder Flow</td>
    <td align="center">Output UI</td>
  </tr>
  <tr>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/asbinder_workflow.png"></th>
    <th rowspan="9"><img src="https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/resources/expect2.png"></th>
  </tr>
</table>

- [ASBinder](https://github.com/GeekTree0101/GTTexture-RxExtension/blob/master/Example/GTTexture-RxExtension/Nodes/ASBinderTestNode.swift)s

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
