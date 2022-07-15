//
//  Model.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import Foundation

struct UserResponse : Codable {

    let data : Data
    let message : String?
    let status : Bool?

   enum CodingKeys: String, CodingKey {
        case data
        case message = "message"
        case status = "status"
    }
}

struct Data : Codable {

    let hasMore : Bool
    let users : [User]

    enum CodingKeys: String, CodingKey {
        case hasMore = "has_more"
        case users = "users"
    }
}

struct User : Codable {

    let image : String
    let items : [String]
    let name : String

    enum CodingKeys: String, CodingKey {
        case image = "image"
        case items = "items"
        case name = "name"
    }
}
