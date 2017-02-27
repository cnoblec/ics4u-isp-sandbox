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
    private var square : SKSpriteNode?
    private var shortSquare : SKSpriteNode?
    //    let width: CGFloat = frame
    
    override func didMove(to view: SKView)
    {
        
        self.rectangle = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 700, height: 100))
        
        if let rectangle = self.rectangle
        {
            rectangle.run(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.removeFromParent()]))
        }
        
        self.shortSquare = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        
        if let shortSquare = self.shortSquare
        {
            shortSquare.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))
        }
        
        self.square = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        
        if let square = self.square
        {
            square.run(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.removeFromParent()]))
        }
        
        self.circle = SKSpriteNode.init(imageNamed: "circle.png")
        
        if let circle = self.circle
        {
            circle.run(SKAction.sequence([SKAction.wait(forDuration: 10), SKAction.removeFromParent()]))
        }
        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
        if let physicsCircle = self.physicsCircle
        {
            physicsCircle.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))
        }
        
        StartingScene()
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
    
    public func StartingScene()
    {
        if let rnode = self.rectangle?.copy() as! SKSpriteNode?
        {
            rnode.position = CGPoint(x: 0, y: -400)
            self.addChild(rnode)
            rnode.physicsBody = SKPhysicsBody(rectangleOf: rnode.size)
        }
        if let cnode = self.circle?.copy() as! SKSpriteNode?
        {
            cnode.position = CGPoint(x: -300, y: -200)
            self.addChild(cnode)
            cnode.physicsBody = SKPhysicsBody(circleOfRadius: (circle?.size.width)! / 2)
        }
        if let bnode = self.square?.copy() as! SKSpriteNode?
        {
            bnode.position = CGPoint(x: -300, y: -500)
            self.addChild(bnode)
            bnode.physicsBody = SKPhysicsBody(rectangleOf: bnode.size)
        }
        if let bnode = self.shortSquare?.copy() as! SKSpriteNode?
        {
            bnode.position = CGPoint(x: 300, y: -500)
            self.addChild(bnode)
            bnode.physicsBody = SKPhysicsBody(rectangleOf: bnode.size)
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
