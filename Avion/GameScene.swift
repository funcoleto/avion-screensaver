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
        
        var fondo = SKSpriteNode(imageNamed: "fondo.png")
        var nubeAbajo = SKSpriteNode(imageNamed: "nubeAbajo.png")
        var nubeAbajoIzquierda = SKSpriteNode(imageNamed: "nubeAbajoIzquierda.png")
        var nubeArribaIzquierda = SKSpriteNode(imageNamed: "nubeArribaIzquierda.png")
        var avion = SKSpriteNode(imageNamed: "soloAvion1.png")
        
        
        

        fondo.position = CGPoint(x: self.size.width / 2 , y: self.size.height / 2)
        fondo.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        fondo.scale(to: CGSize(width: self.size.width, height: self.size.height))
        fondo.zPosition = -1
        fondo.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "fondo.png")!)
        
        self.addChild(fondo)
        
        
        
        
        
        
        var avionTextures:[SKTexture] = []
        
        avionTextures.append(SKTexture(image: Bundle(for: type(of: self)).image(forResource: "soloAvion1.png")!))
        avionTextures.append(SKTexture(image: Bundle(for: type(of: self)).image(forResource: "soloAvion2.png")!))
        
        
        avion.position = CGPoint(x: self.size.width / 2 , y: self.size.height / 2)
        avion.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        avion.zPosition = 5
        avion.scale(to: CGSize(width: self.size.width * 0.3, height: self.size.height * 0.3))

        avion.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "soloAvion1.png")!)
        self.addChild(avion)

        //avion.run(SKAction.repeatForever(SKAction.animate(with: avionTextures,timePerFrame: 0.05,resize: false,restore: false)), withKey: "run")
        
        let aniAvi = SKAction.repeatForever(SKAction.animate(with: avionTextures,timePerFrame: 0.05,resize: false,restore: false))
        
        let move1 = SKAction.moveBy(x: -50, y: -100, duration: 1)
        let move2 = SKAction.moveBy(x: -50, y: +50, duration: 1)
        let move3 = SKAction.moveBy(x: +50, y: +50, duration: 1)
        let move4 = SKAction.moveBy(x: +50, y: +50, duration: 1)
        let move5 = SKAction.moveBy(x: +50, y: -50, duration: 1)
        let move6 = SKAction.moveBy(x: +50, y: -50, duration: 1)
        let move7 = SKAction.moveBy(x: -100, y: +50, duration: 1)
        
        let sec = SKAction.sequence([move1,move2,move3,move4,move5,move6,move7])
        
        let repetMove = SKAction.repeatForever(sec)
        
        avion.run(SKAction.group([aniAvi, repetMove]))
        
        
        
        
        
        nubeAbajo.position = CGPoint(x: self.size.width * 0.3, y: 0 - nubeAbajo.size.height)
        nubeAbajo.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        nubeAbajo.scale(to: CGSize(width: self.size.width * 0.1 , height: self.size.height * 0.1 ))
        nubeAbajo.zPosition = 4
        nubeAbajo.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "nubeAbajo.png")!)
        
        self.addChild(nubeAbajo)
        
        
        let moveNubeAbajo = SKAction.move(to: CGPoint(x: self.size.width + nubeAbajo.size.width , y: self.size.height * 0.4), duration: 20)
        let moverNubeAbajoPrincipio = SKAction.move(to: CGPoint(x: self.size.width * 0.3, y: 0 - nubeAbajo.size.height), duration: 0)
        let secuNubeAbajo = SKAction.sequence([moveNubeAbajo, moverNubeAbajoPrincipio])
        let repetNubeAbajo = SKAction.repeatForever(secuNubeAbajo)
        nubeAbajo.run(repetNubeAbajo)
        
        
        
        
        
        
        
        nubeAbajoIzquierda.position = CGPoint(x: 0 - nubeAbajoIzquierda.size.width, y: 0 - nubeAbajoIzquierda.size.height)
        nubeAbajoIzquierda.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        nubeAbajoIzquierda.scale(to: CGSize(width: self.size.width * 0.1 , height: self.size.height * 0.1 ))
        nubeAbajoIzquierda.zPosition = 3
        nubeAbajoIzquierda.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "nubeAbajoIzquierda.png")!)
        
        self.addChild(nubeAbajoIzquierda)
        
        
        let movenubeAbajoIzquierda = SKAction.move(to: CGPoint(x: self.size.width + nubeAbajoIzquierda.size.width , y: self.size.height + nubeAbajoIzquierda.size.height), duration: 20)
        let movernubeAbajoIzquierdaPrincipio = SKAction.move(to: CGPoint(x: 0 - nubeAbajoIzquierda.size.width, y: 0 - nubeAbajoIzquierda.size.height), duration: 0)
        let secunubeAbajoIzquierda = SKAction.sequence([movenubeAbajoIzquierda, movernubeAbajoIzquierdaPrincipio])
        let repetnubeAbajoIzquierda = SKAction.repeatForever(secunubeAbajoIzquierda)
        nubeAbajoIzquierda.run(repetnubeAbajoIzquierda)
        
        
        
        
        
        
        
        nubeArribaIzquierda.position = CGPoint(x: 0 - nubeAbajoIzquierda.size.width, y: self.size.height * 0.5)
        nubeArribaIzquierda.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        nubeArribaIzquierda.scale(to: CGSize(width: self.size.width * 0.1 , height: self.size.height * 0.1 ))
        nubeArribaIzquierda.zPosition = 6
        nubeArribaIzquierda.texture = SKTexture(image: Bundle(for: type(of: self)).image(forResource: "nubeArribaIzquierda.png")!)
        
        self.addChild(nubeArribaIzquierda)
        
        
        let movenubeArribaIzquierda = SKAction.move(to: CGPoint(x: self.size.width * 0.6 , y: self.size.height + nubeArribaIzquierda.size.height), duration: 20)
        let movernubeArribaIzquierdaPrincipio = SKAction.move(to: CGPoint(x: 0 - nubeAbajoIzquierda.size.width, y: self.size.height * 0.5), duration: 0)
        let secunubeArribaIzquierda = SKAction.sequence([movenubeArribaIzquierda, movernubeArribaIzquierdaPrincipio])
        let repetnubeArribaIzquierda = SKAction.repeatForever(secunubeArribaIzquierda)
        nubeArribaIzquierda.run(repetnubeArribaIzquierda)
        
        
        
        
        
        
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
     
        
        
        
    }
}
