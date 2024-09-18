//
//  TaskListViewController.swift
//  ToDo
//
//  Created by Alumno on 18/09/24.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    var tasks = ["Ir a ISIL", "Estudiar", "Repasar SwiftUI"]

    override func viewDidLoad() {
        super.viewDidLoad()

         }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Tasks"
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController =  segue.destination as? UINavigationController else {
            return
        }
        
        guard let viewController = navigationController.topViewController as? TaskDetailViewController else {
            return
        }
        
        viewController.completion = { task in
            self.tasks.append(task)
            self.tableView.reloadData()
        }
    }

  

}
