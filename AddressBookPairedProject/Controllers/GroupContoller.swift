//
//  GroupContoller.swift
//  AddressBookPairedProject
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class GroupController {
    
    // MARK: - Properties
   
    // singleton
    static let sharedInstance = GroupController()
    // SSOT
    var groups: [Group] = []
    
    // MARK: - Initializers
    
    init() {
        loadConstactsFromDisk()
    }
    
    
    
    
    // MARK: - CRUD functions
    func create(name: String = "Untitled Group", people: [Person] = []) {
        saveContactsToDisk()
    }
    func update(groupToUpdate: Group, newGroupName: String) {
        groupToUpdate.name = newGroupName
        saveContactsToDisk()
    }
    func delete(groupToDelete: Group) {
        guard let index = groups.firstIndex(of: groupToDelete) else {return}
        groups.remove(at: index)
            saveContactsToDisk()
    }
    func saveContactsToDisk() {
        // 1. Get the address to save the file to
        guard let url = fileURL else {return}
        do{
            //2. COnvert the swift struct or class into raw data
            let data = try JSONEncoder().encode(groups)
            //3. Save the data to the address from step 1
            try data.write(to: url)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    func loadConstactsFromDisk() {
        // 1. Get the address your data is saved at
        guard let url = fileURL else {return}
        do {
            //2. load the data from the address
            let data = try Data(contentsOf: url)
            // 3. Decode that data into our Swift model object
            let groups = try JSONDecoder().decode([Group].self, from: data)
            self.groups = groups
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("addressbook.json")
        return finalURL
    }
    
    
} // End of class
