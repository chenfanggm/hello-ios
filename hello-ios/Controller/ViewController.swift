//
//  ViewController.swift
//  hello-ios
//
//  Created by Chen Fang on 11/16/18.
//  Copyright © 2018 Chen Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceFaces()
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        updateDiceFaces()
    }
    
    func updateDiceFaces() {
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        diceImageView1.image = UIImage(named: "dice2")
        
        ProgressHUD.showSuccess();
    }
}

