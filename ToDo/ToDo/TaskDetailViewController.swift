//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by Alumno on 18/09/24.
//

import UIKit

class TaskDetailViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var completion: ((String) -> Void)?
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let completion = completion {
            completion(nameTextField.text ?? "")
        }
        
        
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
}
