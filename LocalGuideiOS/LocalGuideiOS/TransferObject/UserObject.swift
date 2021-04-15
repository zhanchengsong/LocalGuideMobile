//
//  UserObject.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-14.
//

import Foundation
struct UserObject: Codable {
    var username: String?
    var password: String?
    var email: String?
    var userId: String?
    var displayName: String?
    var jwtToken: String?
    var refreshToken: String?
}
