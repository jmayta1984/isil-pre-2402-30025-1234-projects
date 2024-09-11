//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Alumno on 11/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!

    @IBAction func sayHi(_ sender: UIButton) {
        greetingLabel.text = "Hi \(nameTextField.text!)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

