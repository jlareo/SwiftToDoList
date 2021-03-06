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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
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
            
            //To allow to modify the current todo item, we past the current view controller
            detailVC.mainVC = self
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todoArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        
        performSegueWithIdentifier("showTodoItemDetail", sender: self)
        
    }
}

