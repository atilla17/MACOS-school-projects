//
//  ViewController.swift
//  animation
//
//  Created by Alireza Moghaddam on 2019-05-09.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sky.png")!)
        
        var enemies = [enemy2]()
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        for _ in 1...20 {
            
            let x = arc4random_uniform(UInt32(width))
            let y = arc4random_uniform(UInt32(height))
            let spd = arc4random_uniform(20) + 10
           
            let tmp = enemy2(someImg: UIImage(named: "frame-1.png")!, xPos: Int(x), yPos: Int(y), w: 50, h: 70, dx: 1, dy: 0);
            enemies.append(tmp)
            //tmp.walk(speed: CGFloat(spd))
            self.view.addSubview(tmp)
        }
        
       

        
    }
    
  
  


}

