//
//  CommentResponse.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

struct Comment: Decodable {
    
    var id: Int?
    var postId: Int?
    var name: String?
    var email: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case postId = "postId"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}
