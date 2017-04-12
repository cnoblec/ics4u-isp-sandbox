//
//  Configuration.swift
//  Sandbox
//
//  Created by Carlos Noble Curveira on 2017-04-10.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import SpriteKit
import GameplayKit

class Demo: SKScene {
    
    var title = SKLabelNode()
    var friction = SKLabelNode()
    var gravity = SKLabelNode()
    var elastic = SKLabelNode()
    var elasticPos = CGPoint()
    var titlePos = CGPoint()
    var frictionPos = CGPoint()
    var gravityPos = CGPoint()
    var demo = SKSpriteNode()
    
    var selection = "new"
    
    override func didMove(to view: SKView) {
        // Set the background color
        backgroundColor = SKColor.black
        
        // Set the midpoint value
        titlePos = CGPoint(x: size.width / 2.0, y: size.height * (11/12))
        frictionPos = CGPoint(x: size.width / 2, y: size.height  * (3/4))
        gravityPos = CGPoint(x: size.width / 2, y: size.height  * (7/12))
        elasticPos = CGPoint(x: size.width / 2, y: size.height * (5/12))
        
        // This will allow us to see what's happening with the collision
        title = SKLabelNode(fontNamed: "Futura Bold")
        title.position = titlePos
        title.isHidden = false
        title.fontSize = 48
        title.zPosition = 250
        title.fontColor = SKColor.white
        title.text = "Select a demo"
        self.addChild(title)
        
        friction = SKLabelNode(fontNamed: "Futura")
        friction.position = frictionPos
        friction.isHidden = false
        friction.fontSize = 48
        friction.zPosition = 250
        friction.fontColor = SKColor.white
        friction.text = "Friction Demo"
        self.addChild(friction)
        
        gravity = SKLabelNode(fontNamed: "Futura")
        gravity.position = gravityPos
        gravity.isHidden = false
        gravity.fontSize = 48
        gravity.zPosition = 250
        gravity.fontColor = SKColor.white
        gravity.text = "Gravity Demo"
        self.addChild(gravity)
        
        elastic = SKLabelNode(fontNamed: "Futura")
        elastic.position = elasticPos
        elastic.isHidden = false
        elastic.fontSize = 48
        elastic.zPosition = 250
        elastic.fontColor = SKColor.white
        elastic.text = "Elastic Collison Demo"
        self.addChild(elastic)
        
        demo = SKSpriteNode(imageNamed: "DemoButton.png")
        demo.position = CGPoint(x: self.size.width * (1 / 8), y: self.size.height * (10/12))
        demo.setScale(0.3)
        self.addChild(demo)
        
    }
    
    func backToSandbox()
    {
        let scene = Sandbox(size: self.size)
        
        // Configure a transition object to specify the type of animation that handles the move between scenes
        let reveal = SKTransition.reveal(with: SKTransitionDirection.left, duration: 0.5)
        
        // Access the current view and present the new scene
        // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
        self.view!.presentScene(scene, transition: reveal)
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        if demo.frame.contains(pos) {
            print("Demo button pressed.")
            backToSandbox()
        
        } else if gravity.frame.contains(pos) {
            selection = "gravity"
            backToSandbox()
        } else if friction.frame.contains(pos) {
            selection = "friction"
            backToSandbox()
        } else if elastic.frame.contains(pos) {
            selection = "elastic"
            backToSandbox()
        }
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    func getScene() -> String
    {
        return selection
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
