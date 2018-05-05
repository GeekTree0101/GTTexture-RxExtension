//
//  ViewController.swift
//  GTTexture-RxExtension
//
//  Created by Geektree0101 on 05/05/2018.
//  Copyright (c) 2018 Geektree0101. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RxSwift
import RxCocoa
import GTTexture_RxExtension

class TestViewController: ASViewController<ASDisplayNode> {
    
    lazy var buttonNode: ASButtonNode = {
        let node = ASButtonNode()
        node.style.preferredSize = .init(width: 100, height: 100)
        node.backgroundColor = .gray
        node.contentMode = .scaleToFill
        node.clipsToBounds = true
        return node
    }()
    
    
    
    let disposeBag = DisposeBag()
    
    init() {
        super.init(node: ASDisplayNode())
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        self.node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            
            return ASCenterLayoutSpec.init(centeringOptions: .XY,
                                           sizingOptions: [],
                                           child: self.buttonNode)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonNode.rx.tap.subscribe().disposed(by: disposeBag)
        
        Observable.just("https://koreaboo-cdn.storage.googleapis.com/2017/08/sana-1-1.jpg")
            .map { URL(string : $0) }
            .bind(to: buttonNode.rx.imageURL)
            .disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

