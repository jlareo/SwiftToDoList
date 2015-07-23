//
//  AddTodoItemViewController.swift
//  SwiftToDoList
//
//  Created by jlareo on 23/7/15.
//  Copyright (c) 2015 sample. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {

    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var datePickerField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBarButtomPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil )
    }
    
    @IBAction func addTodoItemBarButtomPressed(sender: UIButton) {
        var todoItem = TodoItemModel(task: taskTextField.text, subtask: subtaskTextField.text, date: datePickerField.date)
        mainVC.todoArray.append(todoItem)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
