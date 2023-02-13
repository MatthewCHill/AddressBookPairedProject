//
//  Group.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class Group: Decodable,Encodable {
    let id: UUID
    var name: String
    var people: [Person]
    
    init(id: UUID = UUID(), name: String, people: [Person] = []) {
        self.id = id
        self.name = name
        self.people = people
    }
} //End of class

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.id == rhs.id
    }
}
