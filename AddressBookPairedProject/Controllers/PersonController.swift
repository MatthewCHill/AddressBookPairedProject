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
        // Dont forget to call the save function once made
    }
    static func updatePerson(newName: String, newAddress:String, newPerson: Person) {
        newPerson.name = newName
        newPerson.address = newAddress
        // Dont forget to call the save function once made
    }
    static func delete(personToDelete: Person, from collection: Group) {
        guard let index = collection.people.firstIndex(of: personToDelete) else {return}
        collection.people.remove(at: index)
        // Dont forget to call the save function once made
    }
    
    
    
    
}//End of class
