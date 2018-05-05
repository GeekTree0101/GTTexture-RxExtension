//
//  ASEditableTextNode+RxExtension.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

extension Reactive where Base: ASEditableTextNode {
    
    public var viewRx: Reactive<UITextView> {
        return base.textView.rx
    }
}
