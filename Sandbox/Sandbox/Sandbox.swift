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
    
    var physicsCircle = SKSpriteNode()
    var rectangle = SKSpriteNode()
    var shortSquare = SKSpriteNode()

    var circle = SKSpriteNode()
    var square = SKSpriteNode()
    var triangle = SKSpriteNode()
    
    var circleButton = SKSpriteNode()
    var squareButton = SKSpriteNode()
    var triangleButton = SKSpriteNode()
    
    var cButtonHighlight = SKShapeNode()
    var sButtonHighlight = SKShapeNode()
    var tButtonHighlight = SKShapeNode()
    
    var clear = SKSpriteNode()
    var add = SKSpriteNode()
    var config = SKSpriteNode()
    
    let maxNodes = 30
    
    var newNode = true
    var newNodeType = "circle"
    
    
    
    override func didMove(to view: SKView)
    {
        
        clear = SKSpriteNode(imageNamed: "ClearButton.png")
        clear.position = CGPoint(x:self.size.width / 2, y: self.size.height * (10/12))
        clear.setScale(0.3)
        self.addChild(clear)
        
        add = SKSpriteNode(imageNamed: "AddButton.png")
        add.position = CGPoint(x: self.size.width / (9 / 8), y: self.size.height * (10/12))
        add.setScale(0.3)
        self.addChild(add)
        
        config = SKSpriteNode(imageNamed: "Configuration.png")
        config.position = CGPoint(x: self.size.width * (1 / 8), y: self.size.height * (10/12))
        config.setScale(0.3)
        self.addChild(config)
        
        circleButton = SKSpriteNode(imageNamed: "circle.png")
        circleButton.position = CGPoint(x: self.size.width * (1 / 4), y: self.size.height * (11/12))
        self.addChild(circleButton)
        
        squareButton = SKSpriteNode(imageNamed: "square.png")
        squareButton.position = CGPoint(x: self.size.width * (1 / 2), y: self.size.height * (11/12))
        self.addChild(squareButton)
        
        triangleButton = SKSpriteNode(imageNamed: "triangle.png")
        triangleButton.position = CGPoint(x: self.size.width * (3 / 4), y: self.size.height * (11/12))
        self.addChild(triangleButton)
        
        self.rectangle = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 500, height: 100))
        rectangle.run(SKAction.sequence([SKAction.wait(forDuration: 7),SKAction.removeFromParent()]))
        
        self.shortSquare = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        shortSquare.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.removeFromParent()]))
        
        self.square = SKSpriteNode.init(imageNamed: "square.png")
        square.run(SKAction.sequence([SKAction.wait(forDuration: 7),SKAction.removeFromParent()]))
        
        self.circle = SKSpriteNode.init(imageNamed: "circle.png")
        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
        self.triangle = SKSpriteNode.init(imageNamed: "triangle.png")
        
        cButtonHighlight = SKShapeNode(circleOfRadius: circleButton.size.width / 2 + 1)
        cButtonHighlight.position = CGPoint(x: self.size.width * (1 / 4), y: self.size.height * (11/12))
        self.addChild(cButtonHighlight)
        
        sButtonHighlight = SKShapeNode(rect: square.frame.standardized)
        sButtonHighlight.position = CGPoint(x: self.size.width * (1 / 2), y: self.size.height * (11/12))
        sButtonHighlight.setScale(1.05)
        self.addChild(sButtonHighlight)
        
        let trianglePath = CGMutablePath()
        trianglePath.move(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
        trianglePath.addLine(to: CGPoint(x: triangle.size.width/2, y: -triangle.size.height/2))
        trianglePath.addLine(to: CGPoint(x: 0, y: triangle.size.height/2))
        trianglePath.addLine(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
        
        tButtonHighlight = SKShapeNode(path: trianglePath)
        tButtonHighlight.position = CGPoint(x: self.size.width * (3 / 4), y: self.size.height * (11/12))
        tButtonHighlight.setScale(1.05)
        self.addChild(tButtonHighlight)
        
        sButtonHighlight.isHidden = true
        tButtonHighlight.isHidden = true
        
        rectangle.position = CGPoint(x: 50, y: 350)
        self.addChild(rectangle)
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: rectangle.size)
        
        physicsCircle.position = CGPoint(x: 50, y: 550)
        physicsCircle.name = "circle"
        self.addChild(physicsCircle)
        physicsCircle.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
        
        square.position = CGPoint(x: 50, y: 150)
        self.addChild(square)
        square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
        
        shortSquare.position = CGPoint(x: 550, y: 150)
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
                if node.name == newNodeType
                {
                    node.removeFromParent()
                }
            }
            newNode = false
            
        } else if add.frame.contains(pos) {
            print("Add button pressed.")
            newNode = false
            
        } else if config.frame.contains(pos) {
            print("config button pressed.")
            newNode = false
            
        } else if squareButton.frame.contains(pos) {
            print("square button pressed.")
            newNodeType = "square"
            newNode = false
            sButtonHighlight.isHidden = false
            tButtonHighlight.isHidden = true
            cButtonHighlight.isHidden = true
            
        } else if triangleButton.frame.contains(pos) {
            print("triangle button pressed.")
            newNodeType = "triangle"
            newNode = false
            tButtonHighlight.isHidden = false
            sButtonHighlight.isHidden = true
            cButtonHighlight.isHidden = true
            
        } else if circleButton.frame.contains(pos) {
            print("circle button pressed.")
            newNodeType = "circle"
            newNode = false
            cButtonHighlight.isHidden = false
            sButtonHighlight.isHidden = true
            tButtonHighlight.isHidden = true
            
        } else if self.children.count > maxNodes {
            // remove the first "circle" in the arry when we reach a maximum count
            
            for node in self.children
            {
                if node.name == newNodeType
                {
                    node.removeFromParent()
                    break
                }
            }
        }
        
        
        // create a skspritenode to follow the mouse until realeased
        if newNode == true
        {
            let newCircle = SKSpriteNode(imageNamed: "\(newNodeType).png")
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
                if newNodeType == "circle"
                {
                    n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
                    n.name = "circle"
                } else if newNodeType == "square" {
                    n.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)
                    n.name = "square"
                } else if newNodeType == "triangle" {
                    let trianglePath = CGMutablePath()
                    trianglePath.move(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: triangle.size.width/2, y: -triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: 0, y: triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
                    n.physicsBody = SKPhysicsBody(polygonFrom: trianglePath)
                    n.name = "triangle"
                }
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
