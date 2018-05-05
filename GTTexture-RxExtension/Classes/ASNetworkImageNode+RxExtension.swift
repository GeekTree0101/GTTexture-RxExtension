//
//  ASNetworkImageNode+RxExtension.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

extension Reactive where Base: ASNetworkImageNode {
    
    var url: Binder<URL?> {
        return Binder(self.base) { node, url in
            node.setURL(url, resetToDefault: true)
        }
    }
    
    func url(resetToDefault: Bool) -> Binder<URL?> {
        return Binder(self.base) { node, url in
            node.setURL(url, resetToDefault: resetToDefault)
        }
    }
}

