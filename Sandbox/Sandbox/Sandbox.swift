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
    var config = SKSpriteNode()
    var demo = SKSpriteNode()
    
    var initx : CGFloat = 0
    var inity : CGFloat = 0
    var finalx : CGFloat = 0
    var finaly : CGFloat = 0
    
    let maxNodes = 30
    
    var newNode = true
    var newNodeType = "circle"
    
    var startScene = "standard"
    
    override func didMove(to view: SKView)
    {
        // decide which scene to play
        
        startScene = Demo().selection
        
        clear = SKSpriteNode(imageNamed: "ClearButton.png")
        clear.position = CGPoint(x:self.size.width / 2, y: self.size.height * (10/12))
        clear.setScale(0.3)
        self.addChild(clear)
        
        config = SKSpriteNode(imageNamed: "ConfigButton.png")
        config.position = CGPoint(x: self.size.width / (9 / 8), y: self.size.height * (10/12))
        config.setScale(0.3)
        self.addChild(config)
        
        demo = SKSpriteNode(imageNamed: "DemoButton.png")
        demo.position = CGPoint(x: self.size.width * (1 / 8), y: self.size.height * (10/12))
        demo.setScale(0.3)
        self.addChild(demo)
        
        circleButton = SKSpriteNode(imageNamed: "circle.png")
        circleButton.position = CGPoint(x: self.size.width * (1 / 4), y: self.size.height * (11/12))
        self.addChild(circleButton)
        
        squareButton = SKSpriteNode(imageNamed: "square.png")
        squareButton.position = CGPoint(x: self.size.width * (1 / 2), y: self.size.height * (11/12))
        self.addChild(squareButton)
        
        triangleButton = SKSpriteNode(imageNamed: "triangle.png")
        triangleButton.position = CGPoint(x: self.size.width * (3 / 4), y: self.size.height * (11/12))
        self.addChild(triangleButton)
        
        self.rectangle = SKSpriteNode.init(imageNamed: "square.png")
        rectangle.xScale = 9
        rectangle.run(SKAction.sequence([SKAction.wait(forDuration: 7),SKAction.removeFromParent()]))
        
        self.shortSquare = SKSpriteNode.init(color: UIColor.blue, size: CGSize.init(width: 100, height: 100))
        shortSquare.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.removeFromParent()]))
        
        self.square = SKSpriteNode.init(imageNamed: "square.png")
        square.setScale(1.5)
        square.run(SKAction.sequence([SKAction.wait(forDuration: 7),SKAction.removeFromParent()]))
        
        self.circle = SKSpriteNode.init(imageNamed: "circle.png")
        
        self.physicsCircle = SKSpriteNode.init(imageNamed: "circle.png")
        
        self.triangle = SKSpriteNode.init(imageNamed: "triangle.png")
        
        cButtonHighlight = SKShapeNode(circleOfRadius: circleButton.size.width / 2)
        cButtonHighlight.position = CGPoint(x: self.size.width * (1 / 4), y: self.size.height * (11/12))
        cButtonHighlight.setScale(1.05)
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

        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        //self.physicsWorld.gravity = noGravity
        //self.physicsBody?.velocity
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        initx = pos.x
        inity = pos.y
        if clear.frame.contains(pos) {
            print("Clear button pressed.")
            for node in self.children
            {
                if node.name == newNodeType
                {
                    node.removeFromParent()
                }
            }
            //self.view?.isPaused = true
            newNode = false
            
        } else if config.frame.contains(pos) {
            print("Config button pressed.")
            newNode = false
            // Create the menu scene with the same dimensions as the current scene
            let scene = Config(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.moveIn(with: SKTransitionDirection.right, duration: 0.5)
            
            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            self.view!.presentScene(scene, transition: reveal)

        } else if demo.frame.contains(pos) {
            print("Demo button pressed.")
            newNode = false
            let scene = Demo(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.moveIn(with: SKTransitionDirection.left, duration: 0.5)
            
            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            
            self.view!.presentScene(scene, transition: reveal)
            
            
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
            
        } else if self.children.count > maxNodes + 10 {
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
            newCircle.name = "temp"
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
        finalx = pos.x
        finaly = pos.y
        
        let v : CGVector = CGVector(dx: (finalx - initx) * 1.5, dy: (finaly-inity) * 1.5)
        
        if clear.frame.contains(pos) {
            for node in self.children
            {
                if node.name == "temp"
                {
                    node.removeFromParent()
                }
            }
            //self.view?.isPaused = true
            newNode = false
            
        }
        
        if newNode == true
        {
            // give sknode a phyiscs body
            if let n = self.children.last
            {
                if newNodeType == "circle"
                {
                    n.physicsBody = SKPhysicsBody(circleOfRadius: (physicsCircle.size.width) / 2)
//                    n.physicsBody?.restitution = 1
//                    n.physicsBody?.linearDamping = 0
                    n.physicsBody?.velocity = v
                    n.name = "circle"
                } else if newNodeType == "square" {
                    n.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)
                    n.physicsBody?.velocity = v
                    n.name = "square"
                } else if newNodeType == "triangle" {
                    let trianglePath = CGMutablePath()
                    trianglePath.move(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: triangle.size.width/2, y: -triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: 0, y: triangle.size.height/2))
                    trianglePath.addLine(to: CGPoint(x: -triangle.size.width/2, y: -triangle.size.height/2))
                    n.physicsBody = SKPhysicsBody(polygonFrom: trianglePath)
                    n.physicsBody?.velocity = v
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
