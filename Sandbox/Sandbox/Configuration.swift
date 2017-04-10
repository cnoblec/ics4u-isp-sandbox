//
//  Configuration.swift
//  Sandbox
//
//  Created by Carlos Noble Curveira on 2017-04-10.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import SpriteKit
import GameplayKit

class Config: SKScene {
    
    var title = SKLabelNode()
    var titlePos = CGPoint()
    override func didMove(to view: SKView) {
        // Set the background color
        backgroundColor = SKColor.black
        
        // Set the midpoint value
        titlePos = CGPoint(x: size.width / 2.0, y: size.height * (11/12))
        
        // This will allow us to see what's happening with the collision
        title = SKLabelNode(fontNamed: "Futura")
        title.position = titlePos
        title.isHidden = false
        title.fontSize = 48
        title.zPosition = 250
        title.fontColor = SKColor.white
        title.text = "Configure your world"
        self.addChild(title)
    }
}
