//
//  PersonTableViewController.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import UIKit

class PersonTableViewController: UITableViewController {
    // MARK: - Outlets

    @IBOutlet weak var groupNameTextField: UITextField!
    
    @IBOutlet weak var peopleFilterSwitch: UISwitch!
    var group: Group?
    
    private var filteredPeople: [Person] {
            if peopleFilterSwitch.isOn {
                return group?.people.filter { $0.isFavorite } ?? []
            } else {
                return group?.people ?? []
            }
        }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        groupNameTextField.text = group?.name
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let group = group,
              let groupName = groupNameTextField.text else {return}
        GroupController.sharedInstance.update(groupToUpdate: group, newGroupName: groupName)
    }
    // MARK: - actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let group = group else {return}
        PersonController.createPerson(group: group)
        tableView.reloadData()
    }
    
    @IBAction func peopleFilterToggle(_ sender: Any) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredPeople.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonTableViewCell else {return UITableViewCell()}
                
        let personObject = filteredPeople[indexPath.row]
        cell.person = personObject
        cell.delegate = self
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let group = group else {return}
//            let person = group.people[indexPath.row]
//            PersonController.delete(personToDelete: person, from: group)
             let filteredperson = filteredPeople[indexPath.row]
            PersonController.delete(personToDelete: filteredperson, from: group)
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
        if segue.identifier == "toPersonViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? PersonViewController {
                    let personToSend = filteredPeople[indexPath.row]
                    destinationVC.person = personToSend
                }
            }
        }
    }
}
extension PersonTableViewController: PersonTableViewCellDelegate {
    func toggleFavoriteButtonWasTapped(cell: PersonTableViewCell) {
        guard let person = cell.person else {return}
        PersonController.toggleFavorite(person: person)
        tableView.reloadData()
    }
    

}
