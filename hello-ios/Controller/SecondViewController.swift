//
//  SecondViewController.swift
//  hello-ios
//
//  Created by Chen Fang on 11/25/18.
//  Copyright © 2018 Chen Fang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textPassover: String?

    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = textPassover
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
