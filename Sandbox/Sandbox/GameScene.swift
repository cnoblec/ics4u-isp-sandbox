 //
 //  GameScene.swift
 //  Sandbox
 //
 //  Created by Carlos Noble Curveira on 2017-02-13.
 //  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
 //
 
 import SpriteKit
 import GameplayKit
 
 class GameScene: SKScene {
    
    private var spinnyNode : SKShapeNode?
    private var circle : SKSpriteNode?
    private var physicsCircle : SKSpriteNode?
    private var rectangle : SKSpriteNode?
    
    
    //    let width: CGFloat = frame
    
    override func didMove(to view: SKView)
    {
        
        
        self.circle = SKSpriteNode.init(imageNamed: "circle.png")
        
        if let circle = self.circle
        {
            circle.run(SKAction.sequence([SKAction.removeFromParent()]))
        }
        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
        if let physicsCircle = self.physicsCircle
        {
            physicsCircle.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))
        }

    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        if let n = self.circle?.copy() as! SKSpriteNode?
        {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        if let n = self.circle?.copy() as! SKSpriteNode?
        {
            n.position = pos
        }
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        if let n = self.physicsCircle?.copy() as! SKSpriteNode?
        {
            n.position = pos
            self.addChild(n)
            n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle?.size.width)! / 2)
        }
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
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
