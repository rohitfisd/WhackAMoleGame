//
//  ViewController.swift
//  WhackAMole
//
//  Created by Ramarathinam, Rohit on 10/21/20.
//  Copyright © 2020 Ramarathinam, Rohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var mole = UIButton()
    var score = UILabel()
    var background = UILabel()
    var screenWidth = 0
    var screenHeight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        score.frame = CGRect(x: 0, y: 0, width: screenHeight/10, height: screenHeight/10)
        score.text = "0"
        view.addSubview(score)
        
        background.frame = CGRect(x: 0, y: screenHeight/10, width: screenWidth, height: screenHeight-(screenHeight/10))
        background.backgroundColor = UIColor.green
        view.addSubview(background)
        
        mole.frame = CGRect(x: 0, y: screenHeight/10, width: 30, height: 30)
        mole.backgroundColor = UIColor.brown
        mole.layer.cornerRadius = 15
        mole.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
        
        view.addSubview(mole)
    }
    
    @objc func hitMe(_ sender:UIButton!) {
        print("Got 'em!!")
        count+=1
        score.text = "\(count)"
        mole.removeFromSuperview()
    
        //new mole to appear
        let randomX = Int.random(in: 0...(screenWidth-30))
        let randomY = Int.random(in: (screenHeight/10)...(screenHeight-30))
        mole.frame = CGRect(x: randomX, y: randomY, width: 30, height: 30)
        mole.backgroundColor = UIColor.brown
        mole.layer.cornerRadius = 15
        view.addSubview(mole)
    }
}
