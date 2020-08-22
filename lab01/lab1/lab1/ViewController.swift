//
//  ViewController.swift
//  lab1
//
//  Created by Atilla Puskas on 2019-05-11.
//  Copyright © 2019 Atilla Puskas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var txtUserInput: UITextField!
    @IBOutlet weak var lblDisplayTimer: UILabel!
    var secconds : Int = 0;
    var executing = false;
    var timeout = true;
    var timer: Timer? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblDisplayTimer.text = "Enter minutes";
        //let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire),userInfo: nil, repeats: true )
    }
    //let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire),userInfo: nil, repeats: true )
    @objc func fire()
    {
        if(secconds <= 0)
        {
            timer?.invalidate();
            executing = false;
            timeout = true;
            btnAction.setTitle("Start", for: .normal);
            let minutes = Int(secconds) / 60 % 60
            let seconds = Int(secconds) % 60
            lblDisplayTimer.text = String(format:"%02i:%02i", minutes, seconds)
            return;
        }
        let minutes = Int(secconds) / 60 % 60
        let seconds = Int(secconds) % 60
        lblDisplayTimer.text = String(format:"%02i:%02i", minutes, seconds)
        
        //lblDisplayTimer.text = String(secconds);
        secconds -= 1;
        
    }
    
    @IBAction func BtnPress(_ sender: UIButton) {
        
        if !executing {
            
            if(timeout)
            {
                let myString : String = txtUserInput.text!;
                let input = Int(myString) ?? 0;
                if(input > 0 && input <= 60)
                {
                    secconds = input * 60;
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire),userInfo: nil, repeats: true)
                    executing = true;
                    timeout = false;
                    btnAction.setTitle("Pause", for: .normal);
                }
                else
                {
                    lblDisplayTimer.text = "The number must be between 1 and 60";
                    executing = false;
                }
            }
            else
            {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire),userInfo: nil, repeats: true)
                executing = true;
                btnAction.setTitle("Pause", for: .normal);
            }
        }
        else
        {
            timer?.invalidate();
            executing = false;
            btnAction.setTitle("Resume", for: .normal);
        }
        
    }
    
  
    @IBAction func ValueChanged(_ sender: Any) {
        print("value changed!");
        if(executing)
        {
            timer?.invalidate();
        }
        if(!timeout)
        {
            timeout = true;
        }
        btnAction.setTitle("Start", for: .normal);
    }
    
    
}

