//
//  Model.swift
//  MVCApi
//
//  Created by Fernado Belen on 29/09/2021.
//

import Foundation

class Contact: Codable {
    let name: String
    let email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

class Contacts: Codable {
    let contacts: [Contact]
    
    init(contacts: [Contact]) {
        self.contacts = contacts
    }
}


