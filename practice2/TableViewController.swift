//
//  TableViewController.swift
//  practice2
//
//  Created by Chojaeyoung on 2015. 11. 20..
//  Copyright © 2015년 Chojaeyoung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var viewNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableView is loading")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    [Q]무엇을 하는 함수 인가?
//    -> section의 개수를 반환하는 함수.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       
        return 1
    }
    
//    테이블 뷰가 생성해야할 행의 개수를 반환하는 메소드
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("tableView viewNumber",viewNumber)
        return viewNumber
    }
    
//    개별 행을 구성하기 위한 목적으로 행을 하나하나 만들어 화면에 표시하는 시점에 호출되는 메소드,
//    원하는데이터를구성하여, 값을넣어주면된다.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
        let row = indexPath.row + 1
        print(row, "this is row")
        print(cell, "this is cell")
        cell.textLabel?.text = String(row)
    
        return cell
    }
    
    
//    self.presentingViewController //나를 호출한 놈이 누구냐
//    self.presentedViewController //내가 호출한 놈이 누구냐
    
//    () -> void  =>이런형태는클로져를인자로받을때, C로말하자면함수 포인트를 이야기한다. 
//    대신 함수로 바로 입력할 수 있다.
    
//    [Q]디버그방법이있는지궁금하다. 예를들어 자바스크립트의 console.log 혹은 console.dir같이객체의내부를볼수있는.
//    테이블의 내용을 선택했을 때, 수행할 프로세스를 처리하는 메소드.
//    -> 있다. 일반적인 C처럼 디버깅이 가능하다 예를 들어, example GDB
    
//    테이블의 셀을 클릭,터치 했을 때 동작하는 함수.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Test TableView",presentingViewController)
        //이시점에서 현재 나를 호출한 컨트롤러는 UINavigationController이다.
        //그렇다면, 여기서 nv를 가져와 보자.
        let nv : UINavigationController = presentingViewController as! UINavigationController!
        print("Test viewControllers.count is",nv.viewControllers.count)
        
//      present된 view를 dismiss시켜주는 함수.
        dismissViewControllerAnimated(true, completion: {
            //[Q]위 함수가 호출된 시점은 언제일까?
            //=>아래 값은 nil 최상의 뷰라서 nil인 것인가?
            print("시점 테스트",self.presentingViewController)
          
            //[Q]왜 navigationController를 얻어 올 수 없는 것일까...

            //[Q] 아래 코드가 왜 안되는 것인가?
//            ->반환타입이 UIViewController이기 때문인것 같다. 그렇다면, navigationcontroller를가져올수는없는걸까?
//            let nv : UINavigationController = self.storyboard?.instantiateViewControllerWithIdentifier("navi")

//            let nnv : UINavigationController = self.navigationController!
//            print("nnv카운트",nnv.viewControllers.count)
            
            nv.popToViewController(nv.viewControllers[indexPath.row], animated: true)
            
//            let nv = presentingViewController as? UINavigationController
//            print("nv is ",nv)

//            print("vv",vv)
//                var nv = self.navigationController
//            print("viewController count",vv?.navigationController?.viewControllers.count)
//            print("dismiss")
//            vv?.navigationController?.popToViewController(nv!, animated: true)
////                self.navigationController?.popToViewController(UIViewController, animated: true)
//            nv!.popToViewController(nv!.viewControllers[indexPath.row], animated: true)

//            var tc = self.presentingViewController as! UINavigationController
//            print("tc",tc)
//            print(nv)

        });
//        aCell.titleLabel.text = String(delegate?.number)
//        print(indexPath)
        print("indexPath.row is",indexPath.row)
//        print(tableView)
    }
    
   

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
