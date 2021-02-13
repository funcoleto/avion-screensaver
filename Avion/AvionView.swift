//
//  Wallpaper.swift
//  Avion
//
//  Created by Daniel on 11/02/2021.
//

import ScreenSaver
import SpriteKit

class AvionView: ScreenSaverView {

     
    
       var mazeScene: GameScene?

       override init?(frame: NSRect, isPreview: Bool) {
           super.init(frame: frame, isPreview: isPreview)
           //print("")
           //probably not needed, but cant hurt to check in case we re-use this code later
           for subview in self.subviews {
               subview.removeFromSuperview()
           }

           //Create the SpriteKit View
           let view: SKView = SKView(frame: self.bounds)

           //Create the scene and add it to the view
           mazeScene = GameScene(size: self.bounds.size)
           mazeScene!.scaleMode = .aspectFill
           view.presentScene(mazeScene)

           //add it in as a subview
           self.addSubview(view)
       }

       

      

       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
}
