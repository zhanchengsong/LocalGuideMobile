//
//  UserObject.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-14.
//

import Foundation
class UserObject: Codable {
    let username: String = ""
    let password: String = ""
    let email: String = ""
    let userId: String = ""
    let displayName: String = ""
    
    // Define the coding keys that are different form the object and json
    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case username 
        case password
        case email
        case userId
    }
}
