//
//  ViewController.swift
//  animation
//
//  Created by Alireza Moghaddam on 2019-05-09.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDebug: UILabel!
    @IBOutlet weak var imgBox: UIImageView!
    
    @IBOutlet weak var playerImgBox: UIImageView!
    
    @IBOutlet weak var btn: UIButton!
    
    var iterator = 1
    var xDest: CGFloat = 200;
    var yDest: CGFloat = 40;
    var speed = 0.33;
    var moveAmt: CGFloat = 20;
    var timer: Timer? = nil;
    var regenTimer : Timer? = nil;
    var moving = false;
    var run = false;
    var stamina = 100;
    var regenRate = 1;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        runToggle();
    }
    
    @objc func updateImage() {
        
    playerImgBox.image = UIImage(named: "frame-\(iterator).png")
        
        lblDebug.text = "X:" + String(Float(playerImgBox.frame.origin.x)) + " " + "Y:" + String(Float(playerImgBox.frame.origin.y));
        
        
        
        iterator += 1
    
        if (iterator == 5){
            iterator = 1
        }
        
        //Move the image toward right
        //playerImgBox.frame.origin.x = playerImgBox.frame.origin.x + 20
        
        print(playerImgBox.frame.origin.x)
        
        //InterpolatePosition();
        
        //needs to move right
        if(playerImgBox.frame.origin.x < xDest && playerImgBox.frame.origin.x != xDest)
        {
            playerImgBox.frame.origin.x = playerImgBox.frame.origin.x + moveAmt;
            if(playerImgBox.frame.origin.x > xDest)
            {
                playerImgBox.frame.origin.x = xDest;
            }
        }
        
        //needs to move left
        else if(playerImgBox.frame.origin.x > xDest && playerImgBox.frame.origin.x != xDest)
        {
            playerImgBox.frame.origin.x = playerImgBox.frame.origin.x - moveAmt;
            if(playerImgBox.frame.origin.x < xDest)
            {
                playerImgBox.frame.origin.x = xDest;
            }
        }
        //needs to move up
        if(playerImgBox.frame.origin.y > yDest && playerImgBox.frame.origin.y != yDest)
        {
            playerImgBox.frame.origin.y = playerImgBox.frame.origin.y - moveAmt;
            if(playerImgBox.frame.origin.y < yDest)
            {
                playerImgBox.frame.origin.y = yDest;
            }
        }
        //needs to move down
        else if(playerImgBox.frame.origin.y < yDest && playerImgBox.frame.origin.y != yDest)
        {
            playerImgBox.frame.origin.y = playerImgBox.frame.origin.y + moveAmt;
            if(playerImgBox.frame.origin.y > yDest)
            {
                playerImgBox.frame.origin.y = yDest;
            }
            
        }
        
        if(playerImgBox.frame.origin.y == yDest && playerImgBox.frame.origin.x == xDest)
        {
            timer?.invalidate();
            moving = false;
        }
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view);
            xDest = position.x - playerImgBox.frame.width/2;
            yDest = position.y - playerImgBox.frame.height/2;
            
            if(moving)
            {
                timer?.invalidate();
            }
            StartTimer();
            
            
            
        }
    }
    
    @objc func StartTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: speed,
                                     target: self,
                                     selector: #selector(updateImage),
                                     userInfo: nil,
                                     repeats: true)
        moving = true;
    }
    @objc func StartRegenTimer()
    {
        regenTimer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(RegenTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    //was going to add a stamina meter for fun but ran out of time
    @objc func RegenTimer()
    {
        
    }
    
    @objc func runToggle()
    {
        run = !run;
        if(run)
        {
            speed = 0.1;
            btn.setTitle("walk", for: .normal);
        }
        else
        {
            speed = 0.33;
            btn.setTitle("run", for: .normal);
        }
        
        if(moving)
        {
            timer?.invalidate();
            StartTimer();
            
        }
        
    }


}

