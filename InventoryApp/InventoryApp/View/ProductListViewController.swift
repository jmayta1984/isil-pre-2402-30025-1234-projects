//
//  ProductListViewController.swift
//  InventoryApp
//
//  Created by Alumno on 2/10/24.
//

import UIKit

class ProductListViewController: UITableViewController {

    private var products = Products()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductViewCell else {
            return UITableViewCell()
        }

        cell.load(data: products[indexPath.row])

        return cell
    }

    
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                                                                                                
        guard let navigationController = segue.destination as? UINavigationController else { return }
     
        guard let viewController = navigationController.topViewController as? ProductViewController else { return }
        
        viewController.onCancel = {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
    
            self.dismiss(animated: true)
        }
        
        viewController.onSave = { product in
            self.products.append(product)
            self.tableView.reloadData()
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        viewController.product = products[indexPath.row]
        
        viewController.onEdit = { product in
            self.products[indexPath.row] = product
            self.tableView.reloadData()
        }
    }
    

}
