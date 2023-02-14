//
//  Person.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class Person: Encodable, Decodable {
    let id: UUID
    var name: String
    var address: String
    var isFavorite: Bool
    
    init(id: UUID = UUID(), name: String, address: String, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.address = address
        self.isFavorite = isFavorite
    }
    
} //End of class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}
