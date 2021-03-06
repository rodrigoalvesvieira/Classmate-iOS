//
//  AddDisciplineViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/23/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit

class AddDisciplineViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var newDisciplineTextField: UITextField!
    @IBOutlet weak var newDisciplineTime: UIDatePicker!
    @IBOutlet weak var saveDisciplineButton: UIBarButtonItem!
    
    // Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Custom methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    // Actions
    
    @IBAction func disciplineTextField(sender: AnyObject) {
    }
    
    @IBAction func saveDiscipline(sender: AnyObject) {
        self.view.endEditing(true)
        
        var title = newDisciplineTextField.text
        var time = newDisciplineTime.date
    }
    
}