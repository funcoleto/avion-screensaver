//
//  GameScene.swift
//  Roboleto
//
//  Created by Daniel on 24/10/2020.
//

import SpriteKit
import GameplayKit
import AVFoundation


class GameScene: SKScene {
    
    var back = SKSpriteNode(imageNamed: "avi1.png")

    var backTextures:[SKTexture] = []

    
    
    // MARK: -View Class Methods
    // Custom initializer method
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .gray
        
        
        
    }

    // We have to add the code below to stop Xcode complaining
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        
        
        backTextures.append(SKTexture(imageNamed: "avi1"))
        backTextures.append(SKTexture(imageNamed: "avi2.png"))

        back.position = CGPoint(x: self.size.width / 2 , y: self.size.height / 2)
        back.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        back.scale(to: CGSize(width: self.size.width, height: self.size.height))
        back.zPosition = 10
        back.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "avi1.png")!)
        back.name = "back"
        
        
        self.addChild(back)
        
        
        
    }
    
    var entrarPrimeroOsegundo: Bool = true
    var controlDeTiempoParaCuandoSaleEnemigo: Date = Date()
    override func update(_ currentTime: TimeInterval) {
     
        let segundos = Date().timeIntervalSince(self.controlDeTiempoParaCuandoSaleEnemigo)
        if(segundos >= 0.05){
            
            if entrarPrimeroOsegundo == true {
                let ima = childNode(withName: "back") as! SKSpriteNode
                ima.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "avi2.png")!)
                
                controlDeTiempoParaCuandoSaleEnemigo = Date()
                entrarPrimeroOsegundo = false
            } else {
                
                let ima = childNode(withName: "back") as! SKSpriteNode
                ima.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "avi1.png")!)
                
                controlDeTiempoParaCuandoSaleEnemigo = Date()
                entrarPrimeroOsegundo = true
            }
            
            
        }
        
        
        
        
    }
}
