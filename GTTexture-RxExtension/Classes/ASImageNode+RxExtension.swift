//
//  ASImageNode+RxExtension.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

extension Reactive where Base: ASImageNode {

    var image: Binder<UIImage?> {
        return Binder(self.base) { node, image in
            node.image = image
        }
    }
}
