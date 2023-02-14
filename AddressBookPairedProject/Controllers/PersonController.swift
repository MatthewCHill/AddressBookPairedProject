//
//  PersonController.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class PersonController {
    
    
    
    
    
    // MARK: - CRUD Functions
    
    static func createPerson(name: String = "New Contact", address: String = "", group: Group) {
        var person = Person(name: name, address: address)
        group.people.append(person)
        GroupController.sharedInstance.saveContactsToDisk()
    }
    static func updatePerson(newName: String, newAddress:String, newPerson: Person) {
        newPerson.name = newName
        newPerson.address = newAddress
        GroupController.sharedInstance.saveContactsToDisk()
    }
    static func delete(personToDelete: Person, from collection: Group) {
        guard let index = collection.people.firstIndex(of: personToDelete) else {return}
        collection.people.remove(at: index)
        GroupController.sharedInstance.saveContactsToDisk()
    }
    static func toggleFavorite(person: Person) {
        person.isFavorite.toggle()
        GroupController.sharedInstance.saveContactsToDisk()
    }
    
}//End of class
