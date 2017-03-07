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
    
    private var spinnyNode : SKShapeNode = SKShapeNode()
    private var circle : SKSpriteNode = SKSpriteNode()
    private var physicsCircle : SKSpriteNode = SKSpriteNode()
    private var rectangle : SKSpriteNode = SKSpriteNode()
    private var square : SKSpriteNode = SKSpriteNode()
    private var shortSquare : SKSpriteNode = SKSpriteNode()
    var testNode : SKSpriteNode = SKSpriteNode()
    var NNOOOOde : SKSpriteNode = SKSpriteNode()
    var count : Int = 0
    var end  = 0
    let maxNodes = 30
    
    override func didMove(to view: SKView)
    {
        
        self.testNode = SKSpriteNode.init(imageNamed: "circle.png")

        testNode.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))
        
        self.rectangle = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 700, height: 100))
        rectangle.run(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.removeFromParent()]))
        
        self.shortSquare = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        shortSquare.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.removeFromParent()]))

        self.square = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        square.run(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.removeFromParent()]))
        
        self.circle = SKSpriteNode.init(imageNamed: "circle.png")
        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
        //starting scene
        
        rectangle.position = CGPoint(x: 0, y: -400)
        self.addChild(rectangle)
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: rectangle.size)

        physicsCircle.position = CGPoint(x: -300, y: -200)
        self.addChild(physicsCircle)
        physicsCircle.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
    
        square.position = CGPoint(x: -300, y: -500)
        self.addChild(square)
        square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
        
        shortSquare.position = CGPoint(x: 300, y: -500)
        self.addChild(shortSquare)
        shortSquare.physicsBody = SKPhysicsBody(rectangleOf: shortSquare.size)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)

        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        // remove the first "circle" in the arry when we reach a maximum count
        if self.children.count > maxNodes
        {
            self.removeAllChildren()
//            for node in self.children
//            {
//                if node.name == "circle"
//                {
//                    node.removeFromParent()
//                    break
//                }
//            }
        }
        
        
        // create a skspritenode to follow the mouse until realeased
        let newCircle = SKSpriteNode(imageNamed: "circle.png")
        newCircle.position = pos
        self.addChild(newCircle)
//            for node in self.children
//            {
//                if node.name == "circle"
//                {
//                    end += 1
//                }
//            }
//        }
//        NNOOOOde?.isHidden = true
    
//        // count the number of circle nodes
//        count = 0
//        
//        print("there are \(count) circles in the scene")
//        self.childNode(withName: <#T##String#>)
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        // follow the mouse
        if let n = self.children.last
        {
            n.position = pos
        }
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        // give sknode a phyiscs body
        if let n = self.children.last
        {
            n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
            n.name = "circle"
            end += 1
        }
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        NNOOOOde?.isHidden = true
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
