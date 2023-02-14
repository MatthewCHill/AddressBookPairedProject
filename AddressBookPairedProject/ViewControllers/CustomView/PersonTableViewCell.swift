//
//  PersonTableViewCell.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/14/23.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    // MARK: - Properties
    var person: Person? {
        didSet {
            updateViews()
            updateFavoriteButton()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let person = person else {return}
        personNameLabel.text = person.name
    }
    func updateFavoriteButton() {
        guard let person = person else {return}
        let favoriteImageName = person.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    

}
