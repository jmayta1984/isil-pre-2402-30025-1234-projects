//
//  ProductViewController.swift
//  InventoryApp
//
//  Created by Alumno on 25/09/24.
//

import UIKit

class ProductViewController: UITableViewController {

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text, !name.isEmpty  else { return }
        guard let quantity = quantityTextField.text, !quantity.isEmpty, let number = Int(quantity) else { return }
        
        let product = Product(name: name, quantity: number)
        dismiss(animated: true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
