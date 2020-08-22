//
//  enemy2.swift
//  animation
//
//  Created by Atilla Puskas on 2019-05-21.
//  Copyright © 2019 Alireza. All rights reserved.
//

import Foundation;
import UIKit;


struct Direction{
    public var x : CGFloat;
    public var y : CGFloat;
}
struct SpawnPoint{
    var x : CGFloat;
    var y : CGFloat;
}

public class enemy2 : UIImageView {


    var timer : Timer?;
    var speed : CGFloat?;
    var iterator = 1;
    var spawmPoint : SpawnPoint?;
    var moveDirection : Direction?;
    


    
    init(someImg: UIImage, xPos: Int, yPos: Int, w: Int, h: Int, dx: CGFloat, dy: CGFloat)
    {
        super.init(image: someImg)  //Calling the constructor of the parent
        self.frame = CGRect(x: xPos, y: yPos, width: w, height: h )
        moveDirection?.x = dx;
        moveDirection?.y = dy;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(speed: CGFloat){
        let spd = Double(1/speed)
        timer = Timer.scheduledTimer(timeInterval: spd, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
    }
    
    func setPosition(xPos: CGFloat, yPos: CGFloat){
        
        self.frame.origin = CGPoint(x: xPos, y: yPos)
    }
    
    @objc func animate(){
        
        let stepSize : CGFloat = 10;
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
        self.setPosition(xPos: self.frame.origin.x + moveDirection!.x * stepSize, yPos:self.frame.origin.y + moveDirection!.y * stepSize)
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        

        
        
    }
    
}
