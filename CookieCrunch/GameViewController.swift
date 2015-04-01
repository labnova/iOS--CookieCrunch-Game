//
//  GameViewController.swift
//  CookieCrunch
//
//  Created by Innocenzo Tremamondo on 15/03/15.
//  Copyright (c) 2015 LabNova. All rights reserved.
//

import UIKit
import SpriteKit

//extension SKNode {
//    class func unarchiveFromFile(file : NSString) -> SKNode? {
//        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
//            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
//            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
//            
//            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
//            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
//            archiver.finishDecoding()
//            return scene
//        } else {
//            return nil
//        }
//    }
//}

class GameViewController: UIViewController {
    
    var scene: GameScene!
    
    var level: Level!
    
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    
    override func prefersStatusBarHidden() ->Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configurare la view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        //creare e configurare la scena
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        level = Level(filename: "Level_1")
        scene.level = level
        
        //presentare la scena
        skView.presentScene(scene)
        
        beginGame()

    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

   
}
