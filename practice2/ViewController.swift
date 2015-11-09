//
//  ViewController.swift
//  practice2
//
//  Created by Chojaeyoung on 2015. 11. 3..
//  Copyright © 2015년 Chojaeyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textValue: UILabel!
    var butImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrowButton.backgroundImageForState()
        butImage = UIImage(named:"arrow_red.png")


//        let v = UIView()
//        super.view = v
//        v.backgroundColor = UIColor.whiteColor()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

