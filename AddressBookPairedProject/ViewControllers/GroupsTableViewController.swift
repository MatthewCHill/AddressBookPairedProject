//
//  GroupsTableViewController.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    
    // MARK: - Lifecycle
    
    // MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        GroupController.sharedInstance.create()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroupController.sharedInstance.groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        
        let group = GroupController.sharedInstance.groups[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = group.name
        config.secondaryText = "\(group.people.count)"
        cell.contentConfiguration = config

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let group = GroupController.sharedInstance.groups[indexPath.row]
            GroupController.sharedInstance.delete(groupToDelete: group)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonTableViewController" {
            // what cell
            if let indexPath = tableView.indexPathForSelectedRow {
                //what destination
                if let destinationVC = segue.destination as? PersonTableViewController {
                    let groupToSend = GroupController.sharedInstance.groups[indexPath.row]
                    destinationVC.group = groupToSend
                }
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
