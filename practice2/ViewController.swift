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
    
    var hangle = ["영","일","이","삼","사","오","육","칠","팔","구","십",
        "십일","십이","십삼","십사","십오","십육","십칠","십팔","십구","이십",
        "이십일","이십이","이십삼","이십사","이십오","이십육","이십칠","이십팔","이십구","삽십"]
    
    
    @IBAction func goBackFirstPage(sender: AnyObject) {
        print("touch goBackFisrPage button")
        /* 네비게이션 컨트롤러의 popToRootViewControllerAnimated는 rootView를 제외하고 다른 view를 pop한다. */
        self.navigationController?.popToRootViewControllerAnimated(true)
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
            delegate!.number = 1
            print("gobackRootView")
            
            /* else문이 실행이 되지만, 뷰에는 적용이 되지 않는다.
                이벤트가 일어난 뷰랑 달라서 그런건가..? */
            if(delegate!.cur_ro_state == 0) {
                textValue.text = String(delegate!.number)
                viewTitle.title = String(delegate!.number)
            } else {
                textValue.text = String(hangle[delegate!.number])
                viewTitle.title = String(hangle[delegate!.number])
            }
    }
    //      오수석님 말씀:
    //          if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
    //          위처럼 if문으로 처리하는 것은 좋지 않다.
    //          코드의 의도를 분명히 하자. 위는 반드시 델리거트가 있다고 가정했지만,
    //          if문을 사용함으로써 AppDelegate가 없을 경우 App이 정상동작 하지 않을 수 있다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        //viewDidLoad에서 시점 차이가 발생 할 경우, 앱이 죽어 버릴 수도 있다.
        //차라리 죽어버리는게 났다. 시점에 대해 고려해서 작성하는게 좋다.
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        delegate!.number++
        if(delegate!.cur_ro_state == 0) {
            textValue.text = String(delegate!.number)
            viewTitle.title = String(delegate!.number)
        } else {
            textValue.text = String(hangle[delegate!.number])
            viewTitle.title = String(hangle[delegate!.number])
        }
        if delegate!.number == 1 {
            goBackFirstButton.enabled = false
            goBackFirstButton.tintColor = UIColor.clearColor()
            //tintColor를 변경해서 감춰주기 위해서 사용하는 것은 좋지 않은 방법.
            //원래 용도가 다르기 때문에, 다른 방법을 써주는게 좋다.
        } else {
            goBackFirstButton.enabled = true
            goBackFirstButton.tintColor = nil
        }
        print("number is increase", delegate!.number)
        
        let gesture : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        gesture.minimumPressDuration = 1.0
        self.view.addGestureRecognizer(gesture)
        
    }
    
    func longPressed(longPress : UIGestureRecognizer)
    {
        print("longPressed")
        
        let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        
        let tv : UITableViewController =  storyboard.instantiateViewControllerWithIdentifier("tableView") as! UITableViewController
        
        presentViewController(tv, animated: true, completion: nil)
    }

    @IBAction func buttonArrow(sender: AnyObject) {

    }
    
    /* 화면이 로테이션이 일어 났을 경우 발생하는 함수 */
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        /*  view가 많을 수록 아래 디버깅 코드는 view개수 만큼 찍힌다..
            성능에 문제가 되지 않을까..? */
        if size.width > size.height {
            print("width is big")
            let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
                delegate!.cur_ro_state = 1
                textValue.text = String(hangle[delegate!.number])
                viewTitle.title = String(hangle[delegate!.number])
            
        } else {
            print("width is low")
            if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                delegate.cur_ro_state = 0
                textValue.text = String(delegate.number)
                viewTitle.title = String(delegate.number)
            }
        }
        print("rotate view")
        print(size)
        print(coordinator)
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

