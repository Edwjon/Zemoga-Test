//
//  UserResponse.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

struct User: Decodable {
    
    var id: Int?
    var name: String?
    var phone: String?
    var email: String?
    var website: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case phone = "phone"
        case email = "email"
        case website = "website"
    }
}
