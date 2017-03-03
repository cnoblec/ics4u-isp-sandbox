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
    var testNode : SKSpriteNode?
    var NNOOOOde : SKSpriteNode?
    var count : Int = 0
    var end  = 0
    let maxNodes = 30
    //    let width: CGFloat = frame
    
    override func didMove(to view: SKView)
    {
        
        self.testNode = SKSpriteNode.init(imageNamed: "circle.png")
        
        if let testNode = self.testNode
        {
            testNode.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))
        }
        
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
        
//        if let circle = self.circle
//        {
//            circle.run(SKAction.sequence([SKAction.removeFromParent()]))
//        }
//        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
//        if let physicsCircle = self.physicsCircle
//        {
//            physicsCircle.run(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.removeFromParent()]))
//        }
        
        StartingScene()
     
        if let tNode = self.circle?.copy() as! SKSpriteNode?
        {
            self.addChild(tNode)
            NNOOOOde = tNode
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        if end > maxNodes
        {
            for node in self.children
            {
                if node.name == "circle"
                {
                    node.removeFromParent()
                    break
                }
            }
        }
        if let n = self.physicsCircle?.copy() as! SKSpriteNode?
        {
            n.position = pos
            self.addChild(n)
            
//            for node in self.children
//            {
//                if node.name == "circle"
//                {
//                    end += 1
//                }
//            }
        }
        NNOOOOde?.isHidden = true
        
//        // count the number of circle nodes
//        count = 0
//        
//        print("there are \(count) circles in the scene")
//        self.childNode(withName: <#T##String#>)
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        self.children[end-1].position = pos
//        NNOOOOde?.isHidden = false
//        NNOOOOde?.position = pos
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        if let n = self.physicsCircle?.copy() as! SKSpriteNode?
        {
            n.position = pos
            n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle?.size.width)! / 2)
            n.name = "circle"
            self.addChild(n)
            end += 1
        }
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        NNOOOOde?.isHidden = true
    }
    
    public func StartingScene()
    {
        if let rnode = self.rectangle?.copy() as! SKSpriteNode?
        {
            rnode.position = CGPoint(x: 0, y: -400)
            self.addChild(rnode)
            rnode.physicsBody = SKPhysicsBody(rectangleOf: rnode.size)
        }
        if let cnode = self.physicsCircle?.copy() as! SKSpriteNode?
        {
            cnode.position = CGPoint(x: -300, y: -200)
            self.addChild(cnode)
            cnode.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle?.size.width)! / 2)
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
