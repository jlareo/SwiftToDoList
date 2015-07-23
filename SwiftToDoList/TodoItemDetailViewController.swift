//
//  TodoItemDetailViewController.swift
//  
//
//  Created by jlareo on 22/7/15.
//
//

import UIKit

class TodoItemDetailViewController: UIViewController {
    
    var detailTodoItemModel: TodoItemModel!
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println(self.detailTodoItemModel.task)
        self.taskTextField.text = detailTodoItemModel.task
        self.subTaskTextField.text = detailTodoItemModel.subtask
        self.datePicker.date = detailTodoItemModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func doneBarButtomPressed(sender: UIBarButtonItem) {
        var todoItem = TodoItemModel(task: taskTextField.text, subtask: subTaskTextField.text, date: datePicker.date)
        mainVC.todoArray[mainVC.tableView.indexPathForSelectedRow()!.row] = todoItem
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelBarButtomPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
