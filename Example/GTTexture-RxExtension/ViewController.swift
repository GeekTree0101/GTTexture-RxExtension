//
//  ViewController.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RxSwift
import RxCocoa

class ViewController: ASViewController<ASDisplayNode> {
    let disposeBag = DisposeBag()
    
    init() {
        super.init(node: ASDisplayNode())
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        self.node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            return ASLayoutSpec()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

