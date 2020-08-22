//
//  enemy.swift
//  animation
//
//  Created by Alireza Moghaddam on 2019-05-16.
//  Copyright © 2019 Alireza. All rights reserved.
//

import Foundation
import UIKit

public class enemy :  UIImageView  {    //The enemy class extends the UIImageView.
                                        //So, this class is an UIImageView and can be added to ViewController
    var iterator = 1
    var motionDirection = 1  //+1 indicates forward and -1 indicates backward
    var health = 100
    var timer: Timer?
    
    //init is the constructor of a class
    init(someImg: UIImage, xPos: Int, yPos: Int, w: Int, h: Int)
    {
        super.init(image: someImg)  //Calling the constructor of the parent
        self.frame = CGRect(x: xPos, y: yPos, width: w, height: h )
    }
    
    //Just to show that we can have multiple constructors in class
    init(someImg: UIImage)
    {
        super.init(image: someImg)
        self.frame = CGRect(x: 100, y: 100, width: 50, height: 70 )
    }
    
    //This function is used for serialization. This function is used for serialization and we do not explain it here.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Sets my position. Note: I am UIImageView
    func setPosition(xPos: CGFloat, yPos: CGFloat){
        
        self.frame.origin = CGPoint(x: xPos, y: yPos)
    }
    
    
    func walk(speed: CGFloat)
    {
        let spd = Double(1/speed)
        
        timer = Timer.scheduledTimer(timeInterval: spd, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
    }
    
    @objc func animate(){
        
        //Kill myself whenever I get transparent and invisible
        if (self.alpha < 0) {
            
            self.timer!.invalidate()
            self.removeFromSuperview()
            //print("Killed")
        }
        
        self.image = UIImage(named: "frame-\(iterator).png")
        iterator += 1
        
        if (iterator == 5){
            iterator = 1
        }
        let stepSize = 10
         self.setPosition(xPos: self.frame.origin.x + CGFloat(motionDirection * stepSize), yPos: self.frame.origin.y)
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        //When colliding with walls, the health gets decremented by 20
        //and transparency is reduced by 20%
        if (self.frame.origin.x > width - self.frame.width)
        {
            motionDirection = -1
            self.health -= 20
            self.alpha -= 0.2
        }
        else if(self.frame.origin.x < 0)
        {
            motionDirection = 1
            self.health -= 20
            self.alpha -= 0.2
        }
        
    }
    
}

