//
//  UserStore.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-14.
//

import Foundation
class UserStore {
    private let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
    } ()
    
    func registerUser(username: String, password: String,completion: @escaping (Result<UserObject, Error>) -> Void) {
        let userRegisterBody: [String: Any] = ["username": username, "password": password]
        let jsonBody = try? JSONSerialization.data(withJSONObject: userRegisterBody)
        let url = UserAPI.registerUserUrl
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        let task = session.dataTask(with: request) {
            (data, response, error) in
            let result = self.processUserResponse(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func processUserResponse(data: Data?, error: Error?) -> Result<UserObject, Error>{
        guard let jsonData = data else {
            return .failure(error!)
        }
        return UserAPI.parseUser(fromJson: jsonData)
    }
    

}
