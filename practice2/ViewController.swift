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
    

    @IBOutlet weak var goBackFirstButton: UIBarButtonItem!
    
    
    @IBAction func goBackFirstPage(sender: AnyObject) {
        print("touch goBackFisrPage button")
        /* 네비게이션 컨트롤러의 popToRootViewControllerAnimated는 rootView를 제외하고 다른 view를 pop한다. */
        self.navigationController?.popToRootViewControllerAnimated(true)
        if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            delegate.number = 1
            print("adwqdwdwqwd")
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            delegate.number++
            textValue.text = String(delegate.number)
            viewTitle.title = String(delegate.number)

            
            if delegate.number == 1 {
                goBackFirstButton.enabled = false
                goBackFirstButton.tintColor = UIColor.clearColor()
            } else {
                goBackFirstButton.enabled = true
                goBackFirstButton.tintColor = nil
                         }
            

            print("number is increase", delegate.number)
            
        }
    }

    @IBAction func buttonArrow(sender: AnyObject) {

    }
    
    /*  viewWillDisappear은 화살표를 눌러 view전환을 할때에도 실행이 된다.
        새로운 뷰가 나타날 때 이전 뷰도 사라지기 떄문  */
    override func viewWillDisappear(animated : Bool) {
//        super.viewWillDisappear(animated)
        print("Test print, viewWillDisappear")
        /* view가 부모로부터 삭제되는 과정을 나타내는 함수로 삭제 되는 경우 true를 반환 */
        if (self.isMovingFromParentViewController()){
            print("Test print, remove view from parent")
            
            if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                if delegate.number != 1 {
                    delegate.number--
                    print("number is decrease", delegate.number)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

