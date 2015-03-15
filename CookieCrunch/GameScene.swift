//
//  GameScene.swift
//  CookieCrunch
//
//  Created by Innocenzo Tremamondo on 15/03/15.
//  Copyright (c) 2015 LabNova. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) non è utilizzato in questa app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        let background = SKSpriteNode(imageNamed: "Background")
        addChild(background)
    }
    
    
}
