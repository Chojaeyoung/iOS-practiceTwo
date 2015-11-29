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
        print("func gobackFirstPage")
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            textValue.text = String(hangle[1])
            viewTitle.title = String(hangle[1])
        } else {
            textValue.text = String(1)
            viewTitle.title = String(1)
        }

    }
    //      오수석님 말씀:
    //          if var delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
    //          위처럼 if문으로 처리하는 것은 좋지 않다.
    //          코드의 의도를 분명히 하자. 위는 반드시 델리거트가 있다고 가정했지만,
    //          if문을 사용함으로써 AppDelegate가 없을 경우 App이 정상동작 하지 않을 수 있다.
//                    => 변경 완료.
    
    func viewCheckAndInsertText () {
       let num = self.navigationController?.viewControllers.count
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            textValue.text = String(hangle[num!])
            viewTitle.title = String(hangle[num!])
        } else {
            textValue.text = String(num!)
            viewTitle.title = String(num!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        let num = self.navigationController?.viewControllers.count
        if num! == 1 {
            goBackFirstButton.enabled = false
            goBackFirstButton.tintColor = UIColor.clearColor()
            //tintColor를 변경해서 감춰주기 위해서 사용하는 것은 좋지 않은 방법.
            //원래 용도가 다르기 때문에, 다른 방법을 써주는게 좋다.
        } else {
            goBackFirstButton.enabled = true
            goBackFirstButton.tintColor = nil
        }
        
        let gesture : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        gesture.minimumPressDuration = 1.0
        self.view.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(animated: Bool) {
                viewCheckAndInsertText()
    }
    
    func longPressed(longPress : UIGestureRecognizer)
    {
        print("longPressed")
        
        performSegueWithIdentifier("segueData",sender: self)
        //        segue를 이용해 페이지전환 및 데이터를 전닫하는방법,
        
//        테이블 뷰를뛰어주는 방법.
//        let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
//        let tv : UITableViewController =  storyboard.instantiateViewControllerWithIdentifier("tableView") as! UITableViewController
//        let num = self.navigationController?.viewControllers.count
//        presentViewController(tv, animated: true, completion: nil)
    }
    
//    [Q]presentViewController와 performSegueWithIdentifier의 차이점은무엇인가..?
    
//      새로운 뷰를 뛰울때는 아래 함수가 호출이 된다.
//      그러나, 롱프레스 이벤트에서는 발생하지 않는다..?
//        => presentViewController함수를사용하면 segue를 통해 뷰가 뛰어지는 것이 아닌것 같다.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print("segue test!!!")

        if segue.identifier == "segueData" {
            let num = self.navigationController?.viewControllers.count
            let des = segue.destinationViewController as! TableViewController
//  as 문법에 대해 조사해보도록 하자.
//  =>type지정
            print(num!,"seg11111")
            des.viewNumber = num!
        }
    }

   
    /* 화면이 로테이션이 일어 났을 경우 발생하는 함수 */
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        /*  view가 많을 수록 아래 디버깅 코드는 view개수 만큼 찍힌다..
            성능에 문제가 되지 않을까..? */
          viewCheckAndInsertText()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

