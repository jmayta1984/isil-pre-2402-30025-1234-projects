//
//  ProductViewCell.swift
//  InventoryApp
//
//  Created by Alumno on 2/10/24.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak private var nameLabel: UILabel!
    
    @IBOutlet weak private var quantityLabel: UILabel!
    
    func load(data product: Product) {
        nameLabel.text = product.name
        quantityLabel.text = "\(product.quantity)"
    }
}
