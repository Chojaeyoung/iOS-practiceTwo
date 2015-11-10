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
    
    @IBOutlet weak var viewTitle: UINavigationItem!
    var number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textValue.text = String(self.number)
        viewTitle.title = String(self.number)
        print("viewDidLoad",number)
        number++
    }

    @IBAction func buttonArrow(sender: AnyObject) {

    }
//    
//    override func viewWillAppear(animated: Bool) {
//        print("test", number++)
//        textValue.text = String(self.number)
//        viewTitle.title = String(self.number)
//
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

