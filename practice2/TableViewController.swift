//
//  TableViewController.swift
//  practice2
//
//  Created by Chojaeyoung on 2015. 11. 20..
//  Copyright © 2015년 Chojaeyoung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableView is loading")
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        print(delegate?.number,"TESET")
        print(Int(delegate!.number),"TESET")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    [Q]무엇을 하는 함수 인가?
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("aaaaaaaaaaa")
        return 1
    }
    
//    테이블 뷰가 생성해야할 행의 개수를 반환하는 메소드
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                print("bbbbbbbbbbb")
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        print(delegate?.number,"TESㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇET")


        return Int(delegate!.number)
    }
    
//    개별 행을 구성하기 위한 목적으로 행을 하나하나 만들어 화면에 표시하는 시점에 호출되는 메소드,
//    원하는데이터를구성하여, 값을넣어주면된다.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
        let row = indexPath.row
        print(row, "this is row")
        print(cell, "this is cell")
        cell.textLabel?.text = String(row)

//        cell.titleLabel.text = String(row)
        return cell
    }
    
//    [Q]디버그방법이있는지궁금하다. 예를들어 자바스크립트의 console.log 혹은 console.dir같이객체의내부를볼수있는.
//    테이블의 내용을 선택했을 때, 수행할 프로세스를 처리하는 메소드.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
//        let aCell = self.tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! TableViewCell
        
        print("Ttest TableView")
        
//        aCell.titleLabel.text = String(delegate?.number)
        
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
