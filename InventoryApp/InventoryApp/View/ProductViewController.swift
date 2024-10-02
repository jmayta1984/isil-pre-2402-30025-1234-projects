//
//  ProductViewController.swift
//  InventoryApp
//
//  Created by Alumno on 25/09/24.
//

import UIKit

class ProductViewController: UITableViewController {
    //Closure
    var onSave: ((Product) -> Void)?
    var onEdit: ((Product) -> Void)?
    var onCancel: (() -> Void)?
    
    var product: Product?
    
    @IBOutlet weak private var nameTextField: UITextField!
    
    
    @IBOutlet weak private var quantityTextField: UITextField!
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let onCancel = onCancel else { return }
        onCancel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let product = product else { return }
        nameTextField.text = product.name
        quantityTextField.text = "\(product.quantity)"
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        guard let onCancel = onCancel else { return }
        onCancel()
    }
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text, !name.isEmpty  else { return }
        guard let quantity = quantityTextField.text, !quantity.isEmpty, let number = Int(quantity) else { return }
        
        
        if var product = product {
            product.name = name
            product.quantity = number
            guard let onEdit = onEdit else { return }
            onEdit(product)
            
        } else {
            let newProduct = Product(name: name, quantity: number)
            guard let onSave = onSave else { return }
            onSave(newProduct)

        }

        dismiss(animated: true)
    }
    
 
    
    
}
