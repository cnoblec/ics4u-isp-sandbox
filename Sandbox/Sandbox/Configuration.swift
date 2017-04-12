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
    
    var slider = SKSpriteNode()
    var title = SKLabelNode()
    var titlePos = CGPoint()
    
    var circleButton = SKSpriteNode()
    var squareButton = SKSpriteNode()
    var triangleButton = SKSpriteNode()
    
    var cButtonHighlight = SKShapeNode()
    var sButtonHighlight = SKShapeNode()
    var tButtonHighlight = SKShapeNode()
    
    var config = SKSpriteNode()
    
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
        title.text = "Configure your objects"
        self.addChild(title)
        
        // buttons to select the shape to edit
        circleButton = SKSpriteNode(imageNamed: "circle.png")
        circleButton.position = CGPoint(x: self.size.width * (1 / 4) - 50, y: self.size.height * (10/12))
        self.addChild(circleButton)
        
        squareButton = SKSpriteNode(imageNamed: "square.png")
        squareButton.position = CGPoint(x: self.size.width * (1 / 2) - 50, y: self.size.height * (10/12))
        self.addChild(squareButton)
        
        triangleButton = SKSpriteNode(imageNamed: "triangle.png")
        triangleButton.position = CGPoint(x: self.size.width * (3 / 4) - 50, y: self.size.height * (10/12))
        self.addChild(triangleButton)
        
        cButtonHighlight = SKShapeNode(circleOfRadius: circleButton.size.width / 2 + 1)
        cButtonHighlight.position = CGPoint(x: self.size.width * (1 / 4) - 50, y: self.size.height * (10/12))
        self.addChild(cButtonHighlight)
        
        sButtonHighlight = SKShapeNode(rectOf: squareButton.size)
        sButtonHighlight.position = CGPoint(x: self.size.width * (1 / 2) - 50, y: self.size.height * (10/12))
        sButtonHighlight.setScale(1.05)
        self.addChild(sButtonHighlight)
        
        let trianglePath = CGMutablePath()
        trianglePath.move(to: CGPoint(x: -triangleButton.size.width/2, y: -triangleButton.size.height/2))
        trianglePath.addLine(to: CGPoint(x: triangleButton.size.width/2, y: -triangleButton.size.height/2))
        trianglePath.addLine(to: CGPoint(x: 0, y: triangleButton.size.height/2))
        trianglePath.addLine(to: CGPoint(x: -triangleButton.size.width/2, y: -triangleButton.size.height/2))
        
        tButtonHighlight = SKShapeNode(path: trianglePath)
        tButtonHighlight.position = CGPoint(x: self.size.width * (3 / 4) - 50, y: self.size.height * (10/12))
        tButtonHighlight.setScale(1.05)
        self.addChild(tButtonHighlight)
        
        config = SKSpriteNode(imageNamed: "ConfigButton.png")
        config.position = CGPoint(x: self.size.width / (9 / 8), y: self.size.height * (10/12))
        config.setScale(0.3)
        self.addChild(config)
        
        // set up the slider bars
        
//        self.slider = SKSpriteNode.init(color: UIColor.darkGray, size: CGSize.init(width: 500, height: 5))
//        slider.position = CGPoint(x: 50, y: 150)
//        self.addChild(slider)

    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        if config.frame.contains(pos) {
            print("Add button pressed.")
            // Create the menu scene with the same dimensions as the current scene
            let scene = Sandbox(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.reveal(with: SKTransitionDirection.right , duration: 0.5)

            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            self.view!.presentScene(scene, transition: reveal)
            
        } 
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
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
