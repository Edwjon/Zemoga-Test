//
//  PostResponse.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

struct Post: Decodable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
