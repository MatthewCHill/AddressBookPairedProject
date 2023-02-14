//
//  PersonViewController.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import UIKit

class PersonViewController: UIViewController {
// MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var favoriteButton: UIButton!
    // MARK: - properties
    var person: Person?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
      
    }
    // MARK: - helper functions
    
    func updateViews() {
        guard let person = person else {return}
        nameTextField.text = person.name
        addressTextField.text = person.address
    }
    
    func updateFavoriteButton() {
        guard let person = person else {return}
        let favoriteImageName = person.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    

// MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = person,
              let name = nameTextField.text,
              let address = addressTextField.text else {return}
        PersonController.updatePerson(newName: name, newAddress: address, newPerson: person)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let person = person else {return}
        PersonController.toggleFavorite(person: person)
        updateViews()
    }
}
