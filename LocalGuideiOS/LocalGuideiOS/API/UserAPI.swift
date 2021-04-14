//
//  UserAPI.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-13.
//

import Foundation

enum Endpoint: String {
    case user="user"
    case login="login"
    case token="token"
}
struct UserAPI {
    private static let baseURLString = "https://auth.zhancheng.dev"
    private static func userURL(endpoint: Endpoint, parameters: [String:String]? = nil) -> URL {
        var components = URLComponents(string: baseURLString + "/" + endpoint.rawValue)!
        var queryItems = [URLQueryItem]()
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    static var registerUserUrl: URL {
        return userURL(endpoint: Endpoint.user)
    }
    
    static func parseUser(fromJson data: Data) -> Result<UserObject, Error> {
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserObject.self, from: data)
            return .success(user)
        } catch {
            return .failure(error)
        }
    }
}

