//
//  ViewController.swift
//  SwiftToDoList
//
//  Created by jlareo on 22/7/15.
//  Copyright (c) 2015 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var todoArray: [TodoItemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTodoItemDetail" {
            let detailVC: TodoItemDetailViewController = segue.destinationViewController as! TodoItemDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTodoItem = todoArray[indexPath!.row]
            detailVC.detailTodoItemModel = thisTodoItem
        }
        else if segue.identifier == "showTodoItemAdd"{
            let addTodoItemVC: AddTodoItemViewController = segue.destinationViewController as! AddTodoItemViewController
            addTodoItemVC.mainVC = self
        }
    }
    
    
    @IBAction func addBarButtomPressed(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTodoItemAdd", sender: self)
        println(todoArray.count)
    }
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TodoItemCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TodoItemCell
        
        cell.taskLabel.text = todoArray[indexPath.row].task
        cell.descriptionLabel.text = todoArray[indexPath.row].subtask
        cell.dateLabel.text = Date.toString(date: todoArray[indexPath.row].date)
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        
        performSegueWithIdentifier("showTodoItemDetail", sender: self)
        
    }
}

