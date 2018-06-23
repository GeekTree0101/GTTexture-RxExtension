//
//  ASnode+RxExtension.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa
import UIKit
import PINRemoteImage

/** refer
 public static var normal: UIControlState { get }
 
 public static var highlighted: UIControlState { get } // used when UIControl isHighlighted is set
 
 public static var disabled: UIControlState { get }
 
 public static var selected: UIControlState { get } // flag usable by app (see below)
 **/

extension Reactive where Base: ASButtonNode {
    
    // apply attributedText on all control state
    public var attributedText: ASBinder<NSAttributedString?> {
        return ASBinder(self.base) { node, attributedText in
            self.setAllAttributedTitle(node, attributedText)
        }
    }
    
    // apply attributedText on targeted control state
    public func attributedText(_ controlState: UIControlState) -> ASBinder<NSAttributedString?> {
        return ASBinder(self.base) { node, attributedText in
            node.setAttributedTitle(attributedText, for: controlState)
        }
    }
    
    // apply text with attribute on all control state
    public func text(_ attribute: [NSAttributedStringKey: Any]?) -> ASBinder<String?> {
        return ASBinder(self.base) { node, text in
            guard let text = text else {
                self.setAllAttributedTitle(node, nil)
                return
            }
            let attrText = NSAttributedString(string: text,
                                              attributes: attribute)
            self.setAllAttributedTitle(node, attrText)
        }
    }
    
    // apply text with attribute on targeted control state
    public func text(_ attribute: [NSAttributedStringKey: Any]?,
              target: UIControlState) -> ASBinder<String?> {
        return ASBinder(self.base) { node, text in
            guard let text = text else {
                node.setAttributedTitle(nil, for: target)
                return
            }
            let attrText = NSAttributedString(string: text,
                                              attributes: attribute)
            node.setAttributedTitle(attrText, for: target)
        }
    }
    
    // apply text with attributes
    public func text(applyList: [GTControlStateType]) -> ASBinder<String?> {
        return ASBinder(self.base) { node, text in
            guard let text = text else {
                for apply in applyList {
                    node.setAttributedTitle(nil,
                                            for: apply.state)
                }
                return
            }
            
            for apply in applyList {
                let attrText = NSAttributedString(string: text,
                                                  attributes: apply.attributes)
                node.setAttributedTitle(attrText,
                                        for: apply.state)
            }
        }
    }
    
    public var image: ASBinder<UIImage?> {
        return ASBinder(self.base) { node, image in
            self.setAllImage(node, image: image)
        }
    }
    
    public var backgroundImage: ASBinder<UIImage?> {
        return ASBinder(self.base) { node, image in
            self.setAllBackgroundImage(node, image: image)
        }
    }
    
    public func image(applyList: [GTControlStateType]) -> ASBinder<UIImage?> {
        return ASBinder(self.base) { node, image in
            guard let image = image  else {
                for apply in applyList {
                    node.setImage(nil, for: apply.state)
                }
                return
            }
            
            for apply in applyList {
                node.setImage(apply.image ?? image,
                              for: apply.state)
            }
        }
    }
    
    public func backgroundImage(applyList: [GTControlStateType]) -> ASBinder<UIImage?> {
        return ASBinder(self.base) { node, image in
            guard let image = image  else {
                for apply in applyList {
                    node.setBackgroundImage(nil, for: apply.state)
                }
                return
            }
            
            for apply in applyList {
                node.setBackgroundImage(apply.image ?? image,
                                        for: apply.state)
            }
        }
    }
    
    public var imageURL: ASBinder<URL?> {
        return ASBinder(self.base) { node, url in
            guard let url = url else {
                self.setAllImage(node, image: nil)
                return
            }
            self.downloadImage(node,
                               url: url,
                               target: .image,
                               state: nil)
        }
    }
    
    public var backgroundImageURL: ASBinder<URL?> {
        return ASBinder(self.base) { node, url in
            guard let url = url else {
                self.setAllBackgroundImage(node, image: nil)
                return
            }
            self.downloadImage(node,
                               url: url,
                               target: .backgroundImage,
                               state: nil)
        }
    }
    
    public func image(applyList: [GTControlStateType]) -> ASBinder<URL?> {
        return ASBinder(self.base) { node, url in
            guard let url = url else {
                for apply in applyList {
                    node.setImage(nil, for: apply.state)
                }
                return
            }
            
            for apply in applyList {
                self.downloadImage(node,
                                   url: apply.url ?? url,
                                   target: .image,
                                   state: apply.state)
            }
        }
    }
    
    public func backgroundImage(applyList: [GTControlStateType]) -> ASBinder<URL?> {
        return ASBinder(self.base) { node, url in
            guard let url = url  else {
                for apply in applyList {
                    node.setBackgroundImage(nil, for: apply.state)
                }
                return
            }
            
            for apply in applyList {
                self.downloadImage(node,
                                   url: apply.url ?? url,
                                   target: .backgroundImage,
                                   state: apply.state)
            }
        }
    }
    
    private enum ImageDownloadTarget {
        case image
        case backgroundImage
    }
    
    private func downloadImage(_ node: ASButtonNode,
                               url: URL,
                               target: ImageDownloadTarget,
                               state: UIControlState?) {
        ASPINRemoteImageDownloader.shared
            .downloadImage(with: url,
                           callbackQueue: DispatchQueue.global(qos: .background),
                           downloadProgress: nil,
                           completion: { image, err, id, userInfo in
                            switch target {
                            case .image:
                                if let state = state {
                                    node.setImage(image?.asdk_image(), for: state)
                                } else {
                                    self.setAllImage(node, image: image?.asdk_image())
                                }
                            case .backgroundImage:
                                if let state = state {
                                    node.setBackgroundImage(image?.asdk_image(), for: state)
                                } else {
                                    self.setAllBackgroundImage(node, image: image?.asdk_image())
                                }
                            }
            })
    }
    
    public enum GTControlStateType {
        case normal(Any?)
        case highlighted(Any?)
        case disabled(Any?)
        case selected(Any?)
        
        var state: UIControlState {
            switch self {
            case .normal:
                return .normal
            case .highlighted:
                return .highlighted
            case .disabled:
                return .disabled
            case .selected:
                return .selected
            }
        }
        
        var url: URL? {
            switch self {
            case .normal(let attr):
                return attr as? URL
            case .highlighted(let attr):
                return attr as? URL
            case .disabled(let attr):
                return attr as? URL
            case .selected(let attr):
                return attr as? URL
            }
        }
        
        var image: UIImage? {
            switch self {
            case .normal(let attr):
                return attr as? UIImage
            case .highlighted(let attr):
                return attr as? UIImage
            case .disabled(let attr):
                return attr as? UIImage
            case .selected(let attr):
                return attr as? UIImage
            }
        }
        
        var attributes: [NSAttributedStringKey: Any]? {
            switch self {
            case .normal(let attr):
                return attr as? [NSAttributedStringKey: Any]
            case .highlighted(let attr):
                return attr as? [NSAttributedStringKey: Any]
            case .disabled(let attr):
                return attr as? [NSAttributedStringKey: Any]
            case .selected(let attr):
                return attr as? [NSAttributedStringKey: Any]
            }
        }
    }
    
    private func setAllAttributedTitle(_ node: ASButtonNode,
                                       _ attrText: NSAttributedString?) {
        node.setAttributedTitle(attrText, for: .normal)
        node.setAttributedTitle(attrText, for: .selected)
        node.setAttributedTitle(attrText, for: .highlighted)
        node.setAttributedTitle(attrText, for: .disabled)
    }
    
    private func setAllImage(_ node: ASButtonNode, image: UIImage?) {
        node.setImage(image, for: .normal)
        node.setImage(image, for: .selected)
        node.setImage(image, for: .highlighted)
        node.setImage(image, for: .disabled)
    }
    
    private func setAllBackgroundImage(_ node: ASButtonNode, image: UIImage?) {
        node.setBackgroundImage(image, for: .normal)
        node.setBackgroundImage(image, for: .selected)
        node.setBackgroundImage(image, for: .highlighted)
        node.setBackgroundImage(image, for: .disabled)
    }
}
