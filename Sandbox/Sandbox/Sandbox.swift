 //
 //  GameScene.swift
 //  Sandbox
 //
 //  Created by Carlos Noble Curveira on 2017-02-13.
 //  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
 //
 
 import SpriteKit
 import GameplayKit
 
 class Sandbox: SKScene {
    
    private var circle : SKSpriteNode = SKSpriteNode()
    private var physicsCircle : SKSpriteNode = SKSpriteNode()
    private var rectangle : SKSpriteNode = SKSpriteNode()
    private var square : SKSpriteNode = SKSpriteNode()
    private var shortSquare : SKSpriteNode = SKSpriteNode()
    var clear = SKSpriteNode()
    var add = SKSpriteNode()
    var count : Int = 0
    var end  = 0
    let maxNodes = 30
    var newNode = true
    
    override func didMove(to view: SKView)
    {
        
        clear = SKSpriteNode(imageNamed: "ClearButton.png")
        clear.position = CGPoint(x:0, y: self.size.height / (7 / 3))
        clear.setScale(0.3)
        self.addChild(clear)
        
        add = SKSpriteNode(imageNamed: "AddButton.png")
        add.position = CGPoint(x: self.size.width / (21 / 8), y: self.size.height / (7 / 3))
        add.setScale(0.3)
        self.addChild(add)
        
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
        physicsCircle.name = "circle"
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
        if clear.frame.contains(pos) {
            print("Clear button pressed.")
            for node in self.children
            {
                if node.name == "circle"
                {
                    node.removeFromParent()
                }
            }
            newNode = false
            
        } else if self.children.count > maxNodes {
            // remove the first "circle" in the arry when we reach a maximum count
            
            for node in self.children
            {
                if node.name == "circle"
                {
                    node.removeFromParent()
                    break
                }
            }
        }
        
        
        // create a skspritenode to follow the mouse until realeased
        if newNode == true
        {
            let newCircle = SKSpriteNode(imageNamed: "circle.png")
            newCircle.position = pos
            self.addChild(newCircle)
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        // follow the mouse
        if newNode == true
        {
            if let n = self.children.last
            {
                n.position = pos
            }
        }
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        if newNode == true
        {
            
            // give sknode a phyiscs body
            if let n = self.children.last
            {
                n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
                n.name = "circle"
                end += 1
            }
        }
        newNode = true
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
